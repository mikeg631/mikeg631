public class PlayerCard
{
    private Player owner;
    private String quote;
    public PlayerCard(Player owner,String quote)
    {
        this.owner = owner;
        this.quote = quote;
    }

    public String getQuote()
    {
        return quote;
    }

    public Player getOwner()
    {
        return owner;
    }
}