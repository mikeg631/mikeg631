public class BeginResponse extends Response
{
    private int contestPort;
    private int contestId;
    public BeginResponse(boolean res, int contestPort, int contestId)
    {
        super("Begin",res);
        this.contestPort = contestPort;
        this.contestId = contestId;
    }

    public int getContestPort()
    {
        return this.contestPort;
    }

    public int getContestId() {
        return this.contestId;
    }
}