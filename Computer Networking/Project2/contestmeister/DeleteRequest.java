

public class DeleteRequest extends Request
{
    private int questionNum;

    public DeleteRequest(int questionNum)
    {
        super("Delete");
        this.questionNum = questionNum;
    }

    public int getQuestionNum()
    {
        return questionNum;
    }
}
