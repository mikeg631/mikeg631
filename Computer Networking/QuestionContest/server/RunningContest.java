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
public class RunningContest implements Runnable
{
    Server server;
    ServerSocket contestSocket;
    private Thread worker;
    private AtomicBoolean running = new AtomicBoolean(false);
    private int interval = 1;
    private HashMap<String, Integer> scores;
    public ArrayList<ContestantThread> threads;
    private int contestNum;
    private int questionsRan;
    private int contestId;
    public RunningContest(Server server,int contestNum, ServerSocket socket, int id)
    {
        this.server = server;
        this.contestNum = contestNum;
        this.contestSocket = socket;
        this.scores = new HashMap<String, Integer>();
        this.threads = new ArrayList<ContestantThread>();
        this.questionsRan = 0;
        this.contestId = id;
    }

    public void removeBadContestant()
    {
        for(int i = 0; i < threads.size(); i++)
        {
            if(threads.get(i).bad)
            {
                threads.get(i).interrupt();
                threads.remove(i);
                i--;
            }
        }
    }
    public void interrupt() {
        running.set(false);
        worker.interrupt();
    }

    public boolean isRunning() {
        return running.get();
    }

    public void run()
    {
        running.set(true);
        while (running.get()) {
            try {
                Thread.sleep(interval);
            } catch (InterruptedException e) {
                running.set(false);
                Thread.currentThread().interrupt();
                System.out.println("Thread was interrupted, Failed to complete operation");
            }
            runContest();
        }
    }
    
    public void setThread(Thread t) {
        this.worker = t;
    }

    public void getNicknames()
    {
        for(ContestantThread t1: threads)
        {
         while(!t1.isReady)
         {
                try {
                    Thread.sleep(interval+5);
                } catch (InterruptedException e) {
                    running.set(false);
                    Thread.currentThread().interrupt();
                    System.out.println("Thread was interrupted, Failed to complete operation");
                }
         }   
        }
    }

public void runContest()
{
        Contest c = this.server.contests.get(this.contestNum);
        this.server.runningContests.add(this.contestNum);
        System.out.println("Server is Listening on  Host: " + server.localIP + " port: " + contestSocket.getLocalPort());
        long duration = 60000000000L;
        try{
        contestSocket.setSoTimeout(1);
        } catch(Exception e)
        {

        }
        int f = 1;
        long startTime = System.nanoTime();
        long temp = System.nanoTime() - startTime;
        while (temp < duration) {
            if (temp > f * 15000000000L) {
                System.out.println("Approximately " + (60 - f * 15) + " seconds remaining to sign up for contest "
                        + this.contestNum + " on port " + this.contestSocket.getLocalPort());
                f++;
            }
            try {
                Socket socket = contestSocket.accept();
                ContestantThread t1 = new ContestantThread(this.server, socket, c, contestId);
                Thread t = new Thread(t1);
                t1.setThread(t);
                t.start();
                this.addThread(t1);
                System.out.println("Accepted Connection from:" + socket.getLocalAddress());
            } catch (Exception e) {

            }
             temp = System.nanoTime() - startTime;
        }
        System.out.println("Contest " + this.contestNum + " entry on " + contestSocket.getLocalPort() + " closed. Waiting for all nicknames.");
        this.getNicknames();
        System.out.println("Contest " + this.contestNum + " entry on " + contestSocket.getLocalPort() + "  has obtained all nicknames. Begining contest");
        ArrayList<Integer> qNums = c.getContestQuestionNums();
        int currentTop = 0;
        int totalScore = 0;
        ArrayList<QuestionStat> stats = new ArrayList<QuestionStat>();
        for (Integer i : qNums) {
            int correctResponses = 0;
            Question q = server.questions.get(i);
            char answer = q.getCorrectAnswer();
            if (q != null) {
            questionsRan++;
            for (ContestantThread t1 : threads) {
                t1.sendQuestion(q);
            }
            for (ContestantThread t1 : threads) {
                char ans = t1.getAnswer();
                if ((int)ans == (int)answer) {
                    totalScore++;
                    correctResponses++;
                    this.addScore(t1.nickname);
                    int currScore = this.getScore(t1.nickname);
                    if (currScore > currentTop) {
                        currentTop = currScore;
                    }
                }
            }
            
            double avg = (((double) correctResponses) / (threads.size())) * 100;
            String topScore = ". The top socre is currently " + currentTop + "/" + questionsRan;
            String contestantCorrect = avg + "% of contestants answered this question correctly.";
            for (ContestantThread t1 : threads) {
                String s = "";
                if ((int)t1.currentAnswer == (int)answer) {
                    s = "Correct.";
                } else {
                    s = "Incorrect.";
                }
                s += contestantCorrect + "\n Your score is " + this.getScore(t1.nickname) + "/" + questionsRan
                        + topScore;
                t1.sendAnswer(s);
            }
            
            stats.add(new QuestionStat(i,threads.size(),correctResponses));
        }
        }
        
        // Ending contest
        for(QuestionStat stat : stats)
        {
            c.recordResult(stat.getQuestionNum(),stat.getAttempts(),stat.getCorrect());
        }
        c.setMax(currentTop);
        c.isRun();
        c.setResults((questionsRan * threads.size()), totalScore);
        server.saveContest(c);
        System.out.println("Contest " + this.contestNum + " entry on " + this.contestSocket.getLocalPort() + " complete. Ending contest.");
       this.closeContest();
    }

    public void closeContestSocket()
    {
         for (ContestantThread t1 : threads) {
             t1.interrupt();
             try {
             t1.closeSocket();
             } catch(Exception e)
             {

             }
             try {
                contestSocket.close();
            } catch (Exception e) {
            }
         }
    }

    public void closeContest()
    {
        for (ContestantThread t1 : threads) {
            t1.closeRunningContestantThread();
        }
        try {
        contestSocket.close();
        } catch (Exception e) {
            server.activeContests.remove(contestId);
            server.runningContests.remove(this.contestNum);
            this.interrupt();
        }
        server.activeContests.remove(contestId);
        server.runningContests.remove(Integer.valueOf(this.contestNum));
        this.interrupt();
    }

    public void addScore(String user)
    {
        Integer i = scores.get(user);
        if(i != null)//if this fails, weird error
        {
            this.scores.replace(user, i+1);
            return;
        }
        System.out.println("User doesn't exist");
    }

    public Integer getScore(String user)
    {
        return this.scores.get(user);
    }

    public int getContestNum()
    {
        return this.contestNum;
    }

    public void addThread(ContestantThread t1)
    {
        this.threads.add(t1);
    }

    public boolean addUser(String user)
    {
        if(scores.putIfAbsent(user,Integer.valueOf(0)) == null)
        {
            return true;
        }
        return false;
    }
}
