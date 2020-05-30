import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

public class Contest implements Serializable
{
    private ArrayList<Integer> questionNums;
    private static final long serialVersionUID = 4L;
    private int contestNum;
    private boolean run;
    private int maxCorrect;
    private double averageCorrect;
    private int attempts;
    private int correct;
    private HashMap<Integer, QuestionStat> questionStats;

public Contest(int contestNum)
{
this.contestNum = contestNum;
this.questionNums = new ArrayList<Integer>();
this.run = false;
this.maxCorrect = 0;
this.correct = 0;
this.attempts = 0;
this.averageCorrect = 0;
this.questionStats = new HashMap<Integer, QuestionStat>();

}
public int getContestNum()
{
    return this.contestNum;
}

public ArrayList<Integer> getContestQuestionNums()
{
    return this.questionNums;
}

public void isRun()
{
    run = true;
}

public void addQuestion(int num)
{
    for(Integer i : questionNums)
    {
        if(i.intValue() == num)
        {
            return;
        }
    }
    questionNums.add(num);
    questionStats.put(num,new QuestionStat(num));
    questionNums.sort(null);
}

public void deleteQuestion(int num)
{
    int l = questionNums.size();
    for(int i = 0; i < l; i++)
    {
        if(num == questionNums.get(i))
        {
            questionNums.remove(i);
            questionStats.remove(i);
            questionNums.sort(null);
            break;
        }
    }

}

public void setMax(int i)
{
    this.maxCorrect = i;
}

public int getMax()
{
    return maxCorrect;
}

public void recordResult(int qNum, int tries, int cs)
{
    QuestionStat temp = questionStats.get(qNum);
    temp.recordAttempt(tries,cs);
    questionStats.replace(qNum,temp);
}

public void setResults(int attempts, int correct)
{
    this.attempts = attempts;
    this.correct = correct;
}


public double getAvg()
{
    return (((double)this.correct)/this.attempts);
}


public String getReview()
{
    String s;
    s = this.contestNum + "\t";
    if(run)
    {
        s +=  questionNums.size() + " questions,run, average correct: " + this.getAvg() + "; maximum correct: " + this.getMax();

    }
    else
    {
       s +=  questionNums.size() + " questions,not run";
    }
    return s;
}

    public String getFullReview() {
        String s;
        s = this.contestNum + "\t";
        if (run) {
            s += questionNums.size() + " questions,run, average correct: " + this.getAvg() + "; maximum correct: "
                    + this.getMax();
        for(Integer i: questionNums)
        {
            s += "\n" + questionStats.get(i).questionReview();
        }
        } else {
            s += questionNums.size() + " questions,not run";
        }
        return s;
    }

}
