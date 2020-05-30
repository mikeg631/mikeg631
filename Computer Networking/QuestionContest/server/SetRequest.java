public class SetRequest extends Request {

    private int contestNum;

    public SetRequest(int contestNum) {
        super("Set");
        this.contestNum = contestNum;

    }

    public int getContestNum() {
        return this.contestNum;
    }
}