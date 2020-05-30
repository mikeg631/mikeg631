public class SendAnswer extends Request {
    private char answer;

    public SendAnswer(char answer) {
        super("SendAnswer");
        this.answer = answer;
    }

    public char getAnswer() {
        return this.answer;
    }
}