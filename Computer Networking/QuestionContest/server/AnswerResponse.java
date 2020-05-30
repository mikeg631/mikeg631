public class AnswerResponse extends Response {
    private String resText;

    public AnswerResponse(boolean res, String r) {
        super("AnswerResponse", res);
        this.resText = r;
    }

    public String getResText()
    {
        return this.resText;
    }
}