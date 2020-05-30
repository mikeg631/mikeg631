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

public class ContestantThread implements Runnable
{
    protected Socket contestantSocket;
    public Server server;
    public Contest contest;
    public String nickname;
    public int contestId;
    public char currentAnswer;
    public boolean isReady;
    private Thread worker;
    public boolean bad;
    private AtomicBoolean running = new AtomicBoolean(false);
    private int interval = 1;
    ObjectOutputStream os;
    ObjectInputStream is;

    public void interrupt() {
        running.set(false);
        worker.interrupt();
    }

    boolean isRunning() {
        return running.get();
    }

    public ContestantThread(Server server, Socket socket, Contest c, int id)
    {
        this.server = server;
        this.contestantSocket = socket;
        this.contest = c;
        this.contestId = id;
        this.isReady = false;
        this.bad = false;
        try {
        this.os = new ObjectOutputStream(contestantSocket.getOutputStream());
        this.is = new ObjectInputStream(contestantSocket.getInputStream());
        } catch(Exception e)
        {

        }
    }

    public void run()
    {
          try{        
                Object req;
                req = null;
                os.writeObject(new NicknameResponse(false));
                boolean check = true;
                while(check) {
                    req = is.readObject();
                if(req instanceof NicknameRequest)
                {
                    bad = false;
                    String temp = ((NicknameRequest)req).getName();
                    if(server.activeContests.get(contestId).addUser(temp))
                    {
                        nickname = temp;
                        os.writeObject(new NicknameResponse(true));
                        check = false;
                    } else
                    {
                        os.writeObject(new NicknameResponse(false));
                    }
                }
                else
                {
                    os.writeObject(new BadResponse(false));
                    this.contestantSocket.close();
                    this.bad = true;
                    server.removeBadContestant(contestId);
                }
            }
        } catch (Exception e2) {
            System.out.println("Interesting error");
        }
        this.isReady = true;
        running.set(true);
        while (running.get()) {
            try {
                Thread.sleep(interval);
            } catch (InterruptedException e) {
                running.set(false);
                Thread.currentThread().interrupt();
                System.out.println("Thread was interrupted, Failed to complete operation");
            }
        }
    }

    

    public void sendAnswer(String s)
    {
        if(!isRunning()){
            return;
        }
        try{        
                os.writeObject(new AnswerResponse(true,s));

                } catch(Exception e3)
                {
                    System.out.println("Didn't get I/O");
                }
    }

    public void closeRunningContestantThread() {
        try {
            os.writeObject(new ContestOver(true));
            contestantSocket.close();
            this.interrupt();
        } catch (Exception e3) {
            System.out.println("Didn't get I/O");
            this.interrupt();
        }


    }

    public void closeSocket()
    {
        try {
            contestantSocket.close();
            this.interrupt();
        } catch (Exception e3) {
            this.interrupt();
        }
    }

    public void setThread(Thread t) {
        this.worker = t;
    }



    public char getAnswer()
    {
        try {
            Object req;
            while(true){
            req = is.readObject();
            if(req instanceof SendAnswer)
            {
                currentAnswer = ((SendAnswer)req).getAnswer();
                return currentAnswer;
            }
        }
        } catch (Exception e3) {
            e3.printStackTrace();
            System.out.println("Didn't get I/O");
        }
        return '*';
    }

    public void sendQuestion(Question q)
    {
        if (!isRunning()) {
            return;
        }
        try{        

                os.writeObject(new SendQuestion(true,q.questionNoAnswer()));

                } catch (Exception e3) {
                    e3.printStackTrace();

            System.out.println("Didn't get I/O");
        }
    }
}