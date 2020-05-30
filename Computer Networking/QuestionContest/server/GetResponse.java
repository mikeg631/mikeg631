public class GetResponse extends Response
{
private Question q;

public GetResponse(boolean res, Question q)
{
    super("Get", res);
    this.q = q;
}

public Question getQuestion()
{
    return this.q;
}
}