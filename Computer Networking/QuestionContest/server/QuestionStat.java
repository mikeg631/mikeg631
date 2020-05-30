import java.io.Serializable;

public class QuestionStat implements Serializable
{
    private static final long serialVersionUID = 5L;
    private int questionNum, attempts, correct;
    public QuestionStat(int questionNum)
    {
        this.questionNum = questionNum;
        this.attempts = 0;
        this.correct = 0;
    }

    public QuestionStat(int questionNum, int attempts, int correct) {
        this.questionNum = questionNum;
        this.attempts = attempts;
        this.correct = correct;
    }

    public int getAttempts()
    {
        return attempts;
    }


    public int getQuestionNum()
    {
        return this.questionNum;
    }
    
    public int getCorrect() {
        return this.correct;
    }
    public void recordAttempt(int attempts, int results)
    {
        this.attempts = attempts;
 
            this.correct = results;
    }

    public String questionReview()
    {
        double avg = 100*(((double)correct)/attempts);
        return (questionNum + "\t" + avg + "% correct");

    }
}