

public class PutRequest extends Request
{
    private Question q;

    public PutRequest(Question q)
    {
        super("Put");
        this.q = q;
    }

    public Question getQuestion()
    {
        return this.q;
    }

}