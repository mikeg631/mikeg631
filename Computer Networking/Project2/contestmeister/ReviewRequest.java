public class ReviewRequest extends Request
{
    private int contestNum;
    public ReviewRequest(int contestNum)
    {
        super("Review");
        this.contestNum = contestNum;
    }

    public int getContestNum()
    {
        return this.contestNum;
    }
}