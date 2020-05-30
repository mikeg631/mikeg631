public class AppendResponse extends Response {

private String resText;
    public AppendResponse(boolean res, String resText) {
        super("Append", res);
      this.resText = resText;
    }
    

public String getResText()
{
    return this.resText;
}
}