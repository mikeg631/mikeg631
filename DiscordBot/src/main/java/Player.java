import java.util.ArrayList;
import java.util.Random;

import discord4j.core.object.entity.Member;

public class Player
{
    private String name;
    private Member member;
    private int cardToPlay;
    private ArrayList<String> hand;
    public Player(Member member)
    {
        this.name = member.getNickname().orElse(member.getDisplayName());
        this.member = member;
        this.cardToPlay = -1;
        this.hand = new ArrayList<String>();
    }

    public String getCard(int i)
    {
        return hand.get(i);
    }

    public void removeCard(int i)
    {
        hand.remove(i);
    }

    public void addCard(String s)
    {
        hand.add(s);
    }

    public Member getAsMember()
    {
        return member;
    }

    public void setPlayCard(int i)
    {
        this.cardToPlay = i;
    }

    public String getPlayedCard()
    {
        if(cardToPlay == -1)
        {
            Random rand = new Random();
            this.cardToPlay = (rand.nextInt(hand.size()));
        }
        String temp = hand.get(cardToPlay);
        hand.remove(cardToPlay);
        cardToPlay = -1;
        return temp;

    }

    public String printHand()
    {
        String temp = "";
        for(int i = 0; i < hand.size(); i++)
        {
            temp += "[" + (i+1) + "]" + hand.get(i) + "\n";
        }
        return temp;
    }


 
    public String getName() {
        return name;
    }
}