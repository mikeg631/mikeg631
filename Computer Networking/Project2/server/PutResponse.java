public class PutResponse extends Response
{
    private int questionNum;

    public PutResponse(boolean res, int questionNum)
    {
        super("Put", res);
        this.questionNum = questionNum;
    }

    public int getQuestionNum()
    {
        return this.questionNum;
    }

}