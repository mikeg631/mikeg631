import java.util.HashMap;
import java.util.ArrayList;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.File;
import java.lang.Exception;
import java.io.IOException;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.InetAddress;

public class Server
{
    public HashMap<Integer,Question> questions;
    public HashMap<Integer, Contest> contests;
    public ArrayList<Integer> currentQuestionNums;
    public ArrayList<Integer> currentContestNums;
    public String localIP, hostname;
    public int port;
    public ServerSocket mainServerSocket;
    public ArrayList<ContestmeisterThread> contestmeisterConnections;
    public HashMap<Integer, RunningContest> activeContests;
    public ArrayList<Integer> runningContests;
public Server()
{
    this.activeContests = new HashMap<Integer, RunningContest>();
    this.runningContests = new ArrayList<Integer>();
    this.contestmeisterConnections = new ArrayList<ContestmeisterThread>();
    this.start();
}
    public void start()
    {
        this.initalizeQuestions();
        this.initalizeContests();
        try
        {
        this.mainServerSocket = new ServerSocket(0);
        
        this.localIP = InetAddress.getLocalHost().getHostAddress();
        this.hostname = InetAddress.getLocalHost().getHostName();
        } catch(Exception e)
        {
            System.out.println("Failed to start server");
            System.exit(0);
        }

        port = mainServerSocket.getLocalPort();
        System.out.println("Server is Listening on  Host: " +  localIP + " port: " + port);
        while(true)
        {
                try{
                    Socket socket = this.mainServerSocket.accept();
                    ContestmeisterThread t1 = new ContestmeisterThread(this,socket);
                    Thread t = new Thread(t1);
                    t1.setThread(t);
                    t.start();
                    this.contestmeisterConnections.add(t1);
                    System.out.println("Accepted Connection from:" + socket.getLocalAddress());
                    boolean check = true;
                } catch(Exception e)
                {

                }
            }
        }
    

    public int saveList()
    {
        try {
            File dir = new File("questions");
            File file2 = new File(dir, "questionlist.txt");
            FileOutputStream fileOut = new FileOutputStream(file2);
        ObjectOutputStream objectOut = new ObjectOutputStream(fileOut);
        file2.createNewFile();        
        objectOut.writeObject(this.currentQuestionNums);
        objectOut.close();
        System.out.println("The ArrayList Object  was succesfully written to a file");
        return 1;
        } catch(Exception e)
        {
            System.out.println("Critical error! List not saved sucessfully to \\questions\\questionlist.txt");
            return 0;
        }
    }

    public int saveContestsList() {
        try {
            File dir = new File("contests");
            File file2 = new File(dir, "contestlist.txt");
            FileOutputStream fileOut = new FileOutputStream(file2);
            ObjectOutputStream objectOut = new ObjectOutputStream(fileOut);
            file2.createNewFile();
            objectOut.writeObject(this.currentContestNums);
            objectOut.close();
            System.out.println("The ArrayList Object  was succesfully written to a file");
            return 1;
        } catch (Exception e) {
            System.out.println("Critical error! List not saved sucessfully to \\contests\\contestlist.txt");
            return 0;
        }
    }

    public int saveQuestion(Question q)
    {
        int use  = q.getQuestionNum();
            if(questions.get(use) != null)
            {
               return 0;//need to send bad response TO DO
            }
        try {
            File dir = new File("questions");
            File file1 = new File(dir, "question" + use + ".txt");
            file1.delete();
            if(!file1.createNewFile());
            {
                file1.delete();
                file1.createNewFile();
            }
        FileOutputStream fileOut = new FileOutputStream(file1);
        ObjectOutputStream objectOut = new ObjectOutputStream(fileOut);
        objectOut.writeObject(q);
        objectOut.close();
        currentQuestionNums.add(use);
        this.saveList();
        questions.put(use,q);
        System.out.println("The Object  was succesfully written to a file");
        return use;
        } catch(Exception e)
        {
            System.out.println("The Object  was NOT succesfully written to a file");
            return 0;
        }

    }

    public int saveContest(Contest c) {
        int use = c.getContestNum();
        try {
            File dir = new File("contests");
            File file1 = new File(dir, "contest" + use + ".txt");
            file1.delete();
            if (!file1.createNewFile())
            {
                file1.delete();
                file1.createNewFile();
            }
            FileOutputStream fileOut = new FileOutputStream(file1);
            ObjectOutputStream objectOut = new ObjectOutputStream(fileOut);
            objectOut.writeObject(c);
            objectOut.close();
            if(!currentContestNums.contains(use))
            {
            currentContestNums.add(use);
            }
            this.saveContestsList();
            contests.remove(use);
            contests.put(use,c);
            System.out.println("The Object  was succesfully written to a file");
            return use;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("The Object  was NOT succesfully written to a file");
            return 0;
        }

    }

    public void initalizeContests() {
        System.out.println("Loading contest bank");
        try {
            File dir = new File("contests");
            if (!dir.exists()) {
                dir.mkdir();
            }
            File file2 = new File(dir, "contestlist.txt");
            FileInputStream fileIn = new FileInputStream(file2);
            ObjectInputStream objectIn = new ObjectInputStream(fileIn);
            currentContestNums = (ArrayList<Integer>) objectIn.readObject();
            objectIn.close();
        } catch (Exception e) {
            System.out.println("Can't load contests. Creating empty list.");
            this.currentContestNums = new ArrayList<Integer>();
            int trySave = saveContestsList();
            if (trySave == 0) {
                System.out.println("Couldn't initalize list. Exiting");
                System.exit(0);
            }
            this.initalizeContests();
        }

        int size = currentContestNums.size();

        if (this.currentContestNums.size() < 20) {
            size = 20;
        }

        this.contests = new HashMap<Integer, Contest>(size);
        for (int i = 0; i < this.currentContestNums.size(); i++) {
            Integer g = this.currentContestNums.get(i);
            Contest c = this.loadContest(g);
            if (c != null) {
                this.contests.put(g, c);
            } else {
                System.out.println("Can't load contest. Removing from list");
                this.currentContestNums.remove(i);
                i--;
            }
        }
        this.saveContestsList();

    }

    public void initalizeQuestions()
    {
        System.out.println("Loading question bank");
        try{
        File dir = new File("questions");
        if(!dir.exists()){
            dir.mkdir();
        }
        File file2 = new File(dir, "questionlist.txt");
        FileInputStream fileIn = new FileInputStream(file2);
        ObjectInputStream objectIn = new ObjectInputStream(fileIn);
        this.currentQuestionNums = (ArrayList<Integer>)objectIn.readObject();
        objectIn.close();
        } catch(Exception e)
        {
            System.out.println("Can't load questions. Creating empty list.");
            this.currentQuestionNums = new ArrayList<Integer>();
            int trySave = saveList();
            if(trySave == 0)
            {
                System.out.println("Couldn't initalize list. Exiting");
                System.exit(0);
            }
            this.initalizeQuestions();
             } 

        int size = this.currentQuestionNums.size();

        if(this.currentQuestionNums.size() < 20)
        {
            size = 20;
        }
        
        this.questions = new HashMap<Integer,Question>(size);
        for(int i = 0; i < this.currentQuestionNums.size(); i++)
        {
            Integer g = this.currentQuestionNums.get(i);
            Question q = this.loadQuestion(g);
            if(q != null)
            {
            this.questions.put(g,q);
           } else {
               System.out.println("Can't load question. Removing list from");
               this.currentQuestionNums.remove(i);
               i--;
           }
        }
        this.saveList();

    }
    public void deleteQuestionFile(int g)
    {
        /*consider Making*/
    }
    public Question loadQuestion(int g)
    {
        try {
            File dir = new File("questions");
            File file1 = new File(dir, "question" + g + ".txt");
            FileInputStream fileIn = new FileInputStream(file1);
            ObjectInputStream objectIn = new ObjectInputStream(fileIn);
            Question q = (Question) objectIn.readObject();
            objectIn.close();
            return q;
        } catch (Exception e) {
            System.out.println("Can't load question.");
            return null;
        }
    }

    public  Contest loadContest(int g) {
        try {
            File dir = new File("contests");
            File file1 = new File(dir, "contest" + g + ".txt");
            FileInputStream fileIn = new FileInputStream(file1);
            ObjectInputStream objectIn = new ObjectInputStream(fileIn);
            Contest c = (Contest) objectIn.readObject();
            objectIn.close();
            return c;
        } catch (Exception e) {
            System.out.println("Can't load contest.");
            return null;
        }
    }

    public int[] startContestServer(Contest c)
    {
        try {
            ServerSocket contestServerSocket = new ServerSocket(0);
            int tempPort = contestServerSocket.getLocalPort();
          System.out.println("Server is Listening on  Host: " + localIP + " port: " + tempPort + " for contest " + c.getContestNum());
            int id =  (int) (Math.floor(Math.random() * Math.floor(1000)));
            while(activeContests.containsKey(id))
            {
                id =  (int)(Math.floor(Math.random() * Math.floor(1000)));
            }
            activeContests.put(id,new RunningContest(this,c.getContestNum(),contestServerSocket,id));

            int temp[] = {tempPort, id};
            return temp;
        } catch (Exception e) {
            System.out.println("Failed to start server");
        }
        int[] temp = {0,0};
        return temp;

    }

    public void beginContest(int id)
    {
        RunningContest r = activeContests.get(id);
        Thread t = new Thread(r);
        r.setThread(t);
        activeContests.put(id, r);
        t.start();
    }
public void removeBadContestant(int id)
{
RunningContest r = activeContests.get(id);
r.removeBadContestant();
activeContests.replace(id,r);
}
 public void closeServer()
 {
     for(ContestmeisterThread t1: contestmeisterConnections)
     {
         t1.interrupt();
     }
        try {
            mainServerSocket.close();
        } catch (Exception e3) {
            System.out.println("Couldn't close socket?");
        }
         activeContests.forEach((k, v) -> v.interrupt());
         activeContests.forEach((k, v) -> v.closeContestSocket());
        System.exit(0);

 }

}
