public class AppendRequest extends Request {

    private int contestNum;
    private int questionNum;

    public AppendRequest(int contestNum, int questionNum) {
        super("Append");
        this.contestNum = contestNum;
        this.questionNum = questionNum;

    }

    public int getContestNum() {
        return this.contestNum;
    }

    public int getQuestionNum() {
        return this.questionNum;
    }
}