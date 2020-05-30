public class BadResponse extends Response
{

private String error;
public BadResponse(boolean res, String error) {
    super("Bad", res);
    this.error = error;
}

    public BadResponse(boolean res) {
        super("Bad", res);
        if(res)
        {
        this.error = "Bad request to server";
        } else {
            this.error = "Unknown Error";
        }

    }

public String getError()
{
    return this.error;
}
}
