import java.util.HashMap;
import java.util.ArrayList;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.Exception;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.InetAddress;
import java.util.concurrent.atomic.*;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.File;

public class ContestmeisterThread implements Runnable
{
    protected Socket clientsocket;
    public Server server;
    private Thread worker;
    private AtomicBoolean running = new AtomicBoolean(false);
    private int interval;

    public ContestmeisterThread(Server server,Socket clientsocket)
    {
        this.server = server;
        this.clientsocket = clientsocket;
    }



    public void interrupt() {
        running.set(false);
        worker.interrupt();
    }

    boolean isRunning() {
        return running.get();
    }


    public void run() {
        running.set(true);
        while (running.get()) {
            try {
                Thread.sleep(interval);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                System.out.println("Thread was interrupted, Failed to complete operation");
            }
            doWork();
        }
        System.out.println("Test");
    }
    public void doWork()
    {
                try{        
                ObjectOutputStream os = new ObjectOutputStream(clientsocket.getOutputStream());
                ObjectInputStream is = new ObjectInputStream(clientsocket.getInputStream());
                Object req;
                req = null;
                try{
                req = is.readObject();
                } catch(ClassNotFoundException e3)
                {
                    System.out.println("Interesting error");
                }        
                
                Response res;
                if(req instanceof Request)
                {
                    System.out.println("Recieved request of type:" + ((Request)req).getRequestType());
                    res = sendResponse(((Request)req));

                } 
                else {
                System.out.println("Bad request recieved.");
                res = new BadResponse(true);
            }
            String type = res.getResponseType();
            switch(type)
            {
                case "Kill":
                os.writeObject(res);
                System.out.println("Sending response of type:" + type);
                System.out.println("Server closed");
                clientsocket.close();
                server.closeServer();
                this.interrupt();
                break;
                case "Begin":
                    os.writeObject(res);
                    System.out.println("Sending response of type:" + type);
                    server.beginContest(((BeginResponse)res).getContestId());
                    break;
                
                case "Quit":
                System.out.println("Sending response of type:" + type);
                clientsocket.close();
                this.interrupt();
                break;
                default:
                System.out.println("Sending response of type:" + type);
                os.writeObject(res);
                break;
            }
        }
               catch(IOException e){
                    System.out.println("No connection");
                    try {
                        clientsocket.close();
                        this.interrupt();
                    } catch(IOException e2)
                    { 
                        System.out.println("Weird error closing connection");
                    }
                    
                } 
    }



        public Response sendResponse(Request req) {
        if (req == null) {
            return new BadResponse(true);
        }
        Response res;
        String reqType = req.getRequestType();
        switch (reqType) {
        case "Put":
            res = this.handlePut(((PutRequest) req).getQuestion());
            break;
        case "Set":
            res = this.handleSet(((SetRequest) req).getContestNum());
            break;
        case "Append":
            res = this.handleAppend(((AppendRequest) req).getContestNum(), ((AppendRequest) req).getQuestionNum());
            break;
        case "List":
            res = this.handleList();
            break;
        case "Review":
            res = this.handleReview(((ReviewRequest) req).getContestNum());
            break;
        case "Begin":
            res = this.handleBegin(((BeginRequest) req).getContestNum());
            break;
        case "Get":
            res = this.handleGet(((GetRequest) req).getQuestionNum());
            break;
        case "Delete":
            res = this.handleDelete(((DeleteRequest) req).getQuestionNum());
            break;
        case "Kill":
            res = new KillResponse(true);
            break;
        default:
            res = null;
            break;

        }
        return res;

    }

    public void setThread(Thread t)
    {
        this.worker = t;
    }
    
    public Response handleAppend(int cNum, int qNum) {
        Contest c = this.server.contests.get(cNum);
        Question q = this.server.questions.get(qNum);
        if(this.server.runningContests.contains(cNum))
        {
            return new AppendResponse(false, "Contest " + qNum + " is currently running! Try again later");
        }
        if (c != null) {
            if (q != null) {
                c.addQuestion(qNum);
                server.saveContest(c);
                return new AppendResponse(true, "Added question " + qNum + " to contest " + cNum);
            } else {
                return new AppendResponse(false, "Error: Question " + qNum + " does not exist");
            }
        } else {
            return new AppendResponse(false, "Error: Contest " + cNum + " does not exist");
        }

    }

    public Response handleSet(int cNum) {

        if(server.contests.get(cNum) == null)
        {
        this.server.saveContest(new Contest(cNum));
            return (new SetResponse(true));
    }
        return (new SetResponse(false));

    }

    public Response handlePut(Question q) {

        System.out.println("Attempting to save question");
        int temp = server.saveQuestion(q);
        boolean ret = false;
        if (temp > 0) {
            ret = true;
        }
        return (new PutResponse(ret, temp));

    }

    public Response handleKill() {
        return null;
    }

    public void removeFromList(int g) {
        for (int i = 0; i < server.currentQuestionNums.size(); i++) {
            if (server.currentQuestionNums.get(i) == g) {
                server.currentQuestionNums.remove(i);
                server.questions.remove(g);
            }
        }
    }

    public Response handleDelete(int questionNum) {
        Integer t = Integer.valueOf(questionNum);
        for(Integer g : this.server.runningContests)
        {
            if(this.server.contests.get(g).getContestQuestionNums().contains(t))
            {
                return (new DeleteResponse(false));
            }
        }
        try {
            File dir = new File("questions");
            File file1 = new File(dir, "question" + questionNum + ".txt");
            this.removeFromList(questionNum);
            int trySave = server.saveList();

            if (trySave == 1) {
                file1.delete();
                server.contests.forEach((k, v) ->  v.deleteQuestion(questionNum));
		for(Integer l : server.currentContestNums)
		{
			server.saveContest(server.contests.get(l));
		}

            }
            return (new DeleteResponse(true));

        } catch (Exception e) {
		e.printStackTrace();
            System.out.println("Error Deleteing");
            return (new DeleteResponse(false));
        }
    }

    

    public Response handleReview(int contestNum) {
        Contest c = server.contests.get(contestNum);
        if (c != null) {
            return new ReviewResponse(true, c.getFullReview());
        }
        return new ReviewResponse(false, "Error: Contest " + contestNum + " does not exist");

    }

    public Response handleList() {
        String s = "";
        for(Integer g : this.server.currentContestNums)
        {
        s += this.server.contests.get(g).getReview() + "\n";
        }
        return new ListResponse(true, s);
    }

    public Response handleGet(int questionNum) {
        Question q;
       if (questionNum > 0) {
            q = server.questions.get(questionNum);
            if(q != null){
            return (new GetResponse(true, q));
            }
            return (new GetResponse(false, null));
        }
        return (new GetResponse(false, null));
    }

    public Response handleBegin(int contestNum) {
        Contest c = this.server.contests.get(contestNum);
        // start contest server
        if (c == null) {
            return new BeginResponse(false, 0,0);
        }

        int temp[] = this.server.startContestServer(c);
        return new BeginResponse(true, temp[0], temp[1]);
    }
    }

