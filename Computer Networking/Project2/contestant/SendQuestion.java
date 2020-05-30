public class SendQuestion extends Response
{
    private Question q;
    public SendQuestion(boolean res, Question q)
    {
        super("SendQuestion",res);
        this.q = q;
    }

    public Question getQuestion()
    {
        return this.q;
    }
}