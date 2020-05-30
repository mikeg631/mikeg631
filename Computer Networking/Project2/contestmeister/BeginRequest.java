public class BeginRequest extends Request
{
    private int contestNum;
    public BeginRequest(int contestNum)
    {
        super("Begin");
        this.contestNum = contestNum;

    }

    public int getContestNum()
    {
        return this.contestNum;
    }
}