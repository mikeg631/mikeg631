import java.io.Serializable;
import java.util.ArrayList;

public class Question implements Serializable
{
    private static final long serialVersionUID = 3L;
    private String questionTag, question;
    private int questionNum;
    private char correctAnswer;
    private ArrayList<String> choices;

public Question(String questionTag,String question, ArrayList<String> choices,char correctAnswer)
{
    this.questionTag = questionTag;
    this.question = question;
    this.choices = choices;
    this.correctAnswer = correctAnswer;
    this.questionNum = 0;
}

    public Question(int questionNum, String questionTag, String question, ArrayList<String> choices, char correctAnswer) {
        this.questionTag = questionTag;
        this.question = question;
        this.choices = choices;
        this.correctAnswer = correctAnswer;
        this.questionNum = questionNum;
    }

    public Question(int questionNum, String questionTag, String question, ArrayList<String> choices) {//constructor for sending over server to client
        this.questionTag = questionTag;
        this.question = question;
        this.choices = choices;
        this.correctAnswer = '*';
        this.questionNum = questionNum;
    }

    public Question questionNoAnswer()
    {
        return new Question(this.questionNum, this.questionTag, this.question, this.choices);
    }

public String getQuestion()
{
    return this.question;
}

public String getQuestionTag()
{
    return this.questionTag;
}

public ArrayList<String> getChoices()
{
    return choices;
}

    public char getCorrectAnswer() {
        return this.correctAnswer;
    }

    public int getQuestionNum() {
        return this.questionNum;
    }

    public void setQuestionNum(int t) {
        this.questionNum = t;
        
    }

    public void printQuestionQuiz() {
        System.out.println("Question " + this.questionNum + ":");
        System.out.println(question);
        for (int i = 0; i < choices.size(); i++) {
            System.out.print("(" + (char) (97 + i) + ") " + choices.get(i) + "\n");

        }
    }
    
    public void printQuestion() {
        System.out.println(questionTag);
        System.out.println(question);
        for(int i = 0; i < choices.size(); i++)
        {
            System.out.print("(" + (char)(97+i) + ") " + choices.get(i) + "\n");

        }
    }

    public boolean checkCorrect(char attempt)
    {
        if((int)(attempt) == correctAnswer)
        {
            return true;
        }
        return false;
    }
}