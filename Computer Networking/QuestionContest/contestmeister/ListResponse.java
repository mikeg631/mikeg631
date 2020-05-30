public class ListResponse extends Response
{
    private String list;
    public ListResponse(boolean res, String list)
    {
        super("List", res);
        this.list = list;
    }

    public  String getList()
    {
        return this.list;
    }
}