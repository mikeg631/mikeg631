

public class GetRequest extends Request
{
    private int questionNum;

    public GetRequest(int questionNum)
    {
        super("Get");
        this.questionNum = questionNum;
    }

    public int getQuestionNum()
    {
        return questionNum;
    }

}