import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.stream.Stream;

import discord4j.core.DiscordClient;
import discord4j.core.DiscordClientBuilder;
import discord4j.core.event.domain.lifecycle.ReadyEvent;
import discord4j.core.event.domain.message.MessageCreateEvent;
import discord4j.core.object.entity.Message;
import discord4j.core.object.entity.User;
import discord4j.core.object.reaction.ReactionEmoji;
import discord4j.core.object.util.Snowflake;
import discord4j.core.object.entity.MessageChannel;
import discord4j.core.object.entity.PrivateChannel;
import discord4j.core.object.entity.TextChannel;
import discord4j.core.object.entity.Attachment;
import discord4j.core.object.entity.Channel;
import discord4j.core.object.entity.GuildChannel;
import discord4j.core.object.entity.Member;

public class Bot {
  public static ArrayList<String> memories;
  public static ArrayList<String> hof;
  public static ArrayList<String> bread;
  public static ArrayList<String> pet;
  public static ArrayList<String> temp;
  public static ArrayList<String> norland;
  public static ArrayList<String> panda;
  public static ArrayList<Long> savedIds;
  public static ArrayList<String> tpose;
  public static long lastHofid;
  public static long lastGallid;
  public static long brianLogID;
  public static long  lastYeetsID;
  public static long botID;
  public static  Map<String, Long> userMap;
  public static Map<String, Boolean> isLoggedMap;
  public static Map<Long, Long> channelMap;
  public static int count = 0;


  public static void main(String[] args) {
    memories = initalizeList("memories");
    bread = initalizeList("bread");
    pet = initalizeList("pet");
    temp = initalizeList("temp");
    norland = initalizeList("norland");
    panda = initalizeList("panda");
    tpose = initalizeList("tpose");
    savedIds = initalizeListL("savedIds");
    hof = initalizeList("hof");
    userMap = initalizeUserMap();
    isLoggedMap = initalizeIsLoggedMap();
    //channelMap = initalizeChannelMap();
    //manually intialize userlist
    /*
    userMap.put("Mike", 154033288309243904L);
    */
    saveUserMap();*/


    DiscordClientBuilder builder = new DiscordClientBuilder("token goes here");
    DiscordClient client = builder.build();
    botID = botIDhere;
    long yeetyServer = ;
    boolean logServer = false;
    long hofids = 548370461168500747L;
    long memoriesid = 617218765649608706L;
    long commonsID = 541828631471718411L;
    boolean gameInProgress = false;

    long testChannel = 641778541738065960L;
    long testPost = 642112313247399946L;
    long myID = 119199138578432001L;

    lastHofid = savedIds.get(0);
    lastGallid = savedIds.get(1);
    brianLogID = savedIds.get(2);
    lastYeetsID = savedIds.get(3);
   
    //lastYeetsID = 651116685339656232L;
   //lastGallid = 642910447078604800L;
    //lastHofid = 642042880000655370L;


//logs messages from entire server from specific user


  

if(logServer)
{
	client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        	.filter(message -> message.getChannelId().asLong() == testChannel)
        	.filter(message -> message.getAuthor().map(user -> user.getId()).isPresent() 
        	&& message.getAuthor().map(user -> user.getId()).get().asLong() == myID)//max is dividing
        	.filter(message -> message.getContent().orElse("").startsWith("!logforchat"))
        	.subscribe(message-> { 
   	client.getChannelById(Snowflake.of(commonsID)).subscribe(channel ->  { 
      	if(channel.getType() == Channel.Type.GUILD_TEXT) { ((MessageChannel)channel).getLastMessage()
        	.subscribe(tempMessage -> ((MessageChannel)channel).getMessagesBefore(tempMessage.getId())
        	.subscribe(message2 -> { saveChannel(((TextChannel)channel).getName(),message2.getContent().orElse(null)); 
            	System.out.println("Saving  all message for a channel"); } )); } }); });
}
  






 client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getChannelId().asLong() == testChannel)
        .filter(message -> message.getAuthor().map(user -> user.getId()).isPresent() 
        && message.getAuthor().map(user -> user.getId()).get().asLong() == myID)//max is dividing
        .filter(message -> message.getContent().orElse("").startsWith("!loguser"))
        .subscribe(message-> { 
          String username = message.getContent().orElse("sdfsfsfsfesfsfsfsfeserergsefsefwesfswfegewsfwestgersdge").substring(8);
          if(userMap.containsKey(message.getContent().orElse("sdfsfsfsfesfsfsfsfeserergsefsefwesfswfegewsfwestgersdge").substring(8)))
  {
    isLoggedMap.put(username,true);
    saveIsLoggedMap();
   client.getGuildById(Snowflake.of(541828630788177922L))
   .subscribe(guild -> guild.getChannels()
   .subscribe(channel -> { 
      if(channel.getType() == Channel.Type.GUILD_TEXT) { ((MessageChannel)channel).getLastMessage()
        .subscribe(tempMessage -> ((MessageChannel)channel).getMessagesBefore(tempMessage.getId())
        .filter(message2 -> message2.getAuthor().map(user -> user.getId()).isPresent()
            && message2.getAuthor().map(user -> user.getId()).get().asLong() == userMap.get(username))// logging this user
        .subscribe(message2 -> { saveMessage(username , message2.getContent().orElse(null));
            System.out.println("Saving " + username + " message"); })); } } )); 
  }
});


  if(logServer) { // logs entire server
    client.getGuildById(Snowflake.of(541828630788177922L))
   .subscribe(guild -> guild.getChannels()
   .subscribe(channel -> { 
      if(channel.getType() == Channel.Type.GUILD_TEXT) { ((MessageChannel)channel).getLastMessage()
        .subscribe(tempMessage -> ((MessageChannel)channel).getMessagesBefore(tempMessage.getId())
        .subscribe(message2 -> { saveChannel( channel.getName(),message2.getAuthor().orElse(null).getUsername(), message2.getContent().orElse(null));
            System.out.println("Saving message from " + channel.getName()); })); } } ));
        }




    client.getEventDispatcher().on(ReadyEvent.class).subscribe(event -> {
      User self = event.getSelf();
      System.out.println(String.format("Logged in as %s#%s", self.getUsername(), self.getDiscriminator()));
    });

 //below is used to update !randomyeet every now and then
        
client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getChannelId().asLong() == testChannel)
        .filter(message -> message.getAuthor().map(user -> user.getId()).isPresent() 
        && message.getAuthor().map(user -> user.getId()).get().asLong() == myID)//max is dividing
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!lograndomyeets"))
        .subscribe(test-> {

            client.getChannelById(Snowflake.of(commonsID)).subscribe(tempChannel -> ((MessageChannel) tempChannel)
              .getMessagesAfter(Snowflake.of(lastYeetsID)).subscribe(message2 -> saveImages("temp", temp, message2)));
          client.getChannelById(Snowflake.of(commonsID))
              .subscribe(tempChannel -> ((MessageChannel) tempChannel).getLastMessage().subscribe(message3 -> {
                savedIds.set(3, message3.getId().asLong());
                saveListL("savedIds", savedIds);
              })); } 
            );

//below begins the logging of select channels - for now Brians, the hof and gallery
 //test channel
    client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getChannelId().asLong() == testChannel)
        .subscribe(message -> System.out.println(message.getContent().orElse(null)));

        client.getChannelById(Snowflake.of(649790199739449354L)).subscribe(tempChannel -> ((MessageChannel) tempChannel).getMessagesAfter(Snowflake.of(brianLogID)).take(Duration.ofSeconds(60L))
      .subscribe(message -> { saveChannel("Brian",message.getAuthor().orElse(null).getUsername(), message.getContent().orElse(null));
        savedIds.set(2,message.getId().asLong()); 
          saveListL("savedIds", savedIds);
        System.out.println("Saving brian channel message"); }
        ));

        client.getChannelById(Snowflake.of(hofids)).subscribe(tempChannel -> ((MessageChannel) tempChannel)
        .getMessagesAfter(Snowflake.of(lastHofid))
       .take(Duration.ofSeconds(60L))
       .subscribe(message -> {
          savedIds.set(0,message.getId().asLong()); 
          saveListL("savedIds", savedIds);
          saveImages("hof", hof, message); }
        ));
       client.getChannelById(Snowflake.of(memoriesid))
        .subscribe(tempChannel -> ((MessageChannel) tempChannel).getMessagesAfter(Snowflake.of(lastGallid))
        .take(Duration.ofSeconds(60L)).subscribe(message -> {
          savedIds.set(1,message.getId().asLong()); 
          saveListL("savedIds", savedIds);
          saveImages("memories", memories, message); }
         ));

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getChannelId().asLong() == hofids)
        .subscribe(message -> {
          savedIds.set(0,message.getId().asLong()); 
          saveListL("savedIds", savedIds);
          saveImages("hof", hof, message); });

         client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getChannelId().asLong() == memoriesid)
        .subscribe(message -> {
          savedIds.set(1, message.getId().asLong());
          saveListL("savedIds", savedIds);
          saveImages("memories", memories, message);
        });

        //Bellow here starts the commands

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").startsWith("!petadd"))
        .subscribe(message -> { if(saveImages("pet", pet, message)) { 
          message.addReaction(ReactionEmoji.unicode("\u2705")).subscribe();
          message.addReaction(ReactionEmoji.custom(Snowflake.of(605277734746193930L), "DOG" ,false)).subscribe(); 
      } else { 
            message.addReaction(ReactionEmoji.unicode("\u274C")).subscribe();
            message.addReaction(ReactionEmoji.custom(Snowflake.of(544329710025441290L), "sad", false)).subscribe();
        } });
        

        /*client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .subscribe(message -> message.getUserMentions().subscribe(user -> { if(user.getId().asLong() == botID)
        {
          message.getChannel().subscribe(channel -> ((MessageChannel)channel).createMessage(getBotResponse(message.getContent().orElse("picture"))).subscribe());
        }
      }));*/
      /*
      client.getChannelById(Snowflake.of(541828631471718411L)).subscribe(//add angy react
        channel -> ((MessageChannel)channel).getMessageById(Snowflake.of(653118933511045170L)).subscribe(
          message ->  message.addReaction(ReactionEmoji.custom(Snowflake.of(623913365651062784L), "angy", false)).subscribe()));*/
        


         client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!memories")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(spec -> {
          String temp2 = getRandomElement(memories);
          spec.addFile(temp2, postFile("memories", temp2));
        })).subscribe();


        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!randomyeet")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(spec -> {
          String temp2 = getRandomElement(temp);
          spec.addFile(temp2, postFile("temp", temp2));
        })).subscribe();

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!norland")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(spec -> {
          String temp2 = getRandomElement(norland);
          spec.addFile(temp2, postFile("norland", temp2));
        })).subscribe();

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!panda")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(spec -> {
          String temp2 = getRandomElement(panda);
          spec.addFile(temp2, postFile("panda", temp2));
        })).subscribe();

      
         client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!hof")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(spec -> {
          String temp2 = getRandomElement(hof);
          spec.addFile(temp2, postFile("hof", temp2));
        })).subscribe();
        
        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!pet")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(spec -> {
          String temp2 = getRandomElement(pet);
          spec.addFile(temp2, postFile("pet", temp2));
        })).subscribe();

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!bread")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(spec -> {
          String temp2 = getRandomElement(bread);
          spec.addFile(temp2, postFile("bread", temp2));
        })).subscribe();

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!quotegame")).flatMap(Message::getChannel)
        .subscribe(channel -> playGame(client,((GuildChannel)channel).getGuildId() ,((TextChannel)channel), "yeet")
        );

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!tpose")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(spec -> {
          String temp2 = getRandomElement(tpose);
          spec.addFile(temp2, postFile("tpose", temp2));
        })).subscribe();

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!tposeadd")).subscribe(message -> {
          if (saveImages("tpose", tpose, message)) {
            message.addReaction(ReactionEmoji.unicode("\u2705")).subscribe();
            message.addReaction(ReactionEmoji.custom(Snowflake.of(629796343933698048L), "judgemenT", false)).subscribe();
          } else {
            message.addReaction(ReactionEmoji.unicode("\u274C")).subscribe();
            message.addReaction(ReactionEmoji.custom(Snowflake.of(544329710025441290L), "sad", false)).subscribe();
          }
        });

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!vibecheck")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(spec -> {
          spec.addFile("vibecheck.png", postFile("other", "vibecheck.png"));
        })).subscribe();


        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").matches("![A-Za-z]+quote[s]*")).subscribe( message -> {//fix this later get properly length
          String temp =  message.getContent().orElse("fsfsfsfsfsfsfsfsfsfs");
          String username =  temp.substring(1,temp.length()-5);
          message.getChannel().subscribe( channel -> {
          if(isLoggedMap.getOrDefault(username,false))
        {
        channel.createMessage(spec -> spec.setContent(getUserQuote(username))).subscribe();
        } else
        {
           channel.createMessage(spec -> spec.setContent("Sorry this user isn't logged for quotes :(")).subscribe();
        }
       });
       } ); 

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> !user.isBot()).orElse(false))
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!help")).flatMap(Message::getChannel)
        .flatMap(channel -> ((MessageChannel) channel).createMessage(
          "!bread - posts pic of beautiful bread, (" + bread.size() + " images)\n " 
        + "!brianquote - posts a random message from brian (nsfw)\n"
          + "![user]quote - quote from user if user is logged(pretty much the case for everyone :D )\n"
        + "!hof - posts a random picture from the hof channel (" + hof.size() + " images)\n"
        + "!memories - posts a galllery image, (" + memories.size() + " images)\n"
        + "!norland - posts a wild norland (" + norland.size() + " images)\n"
        + "!panda - posts brian's panda, (" + panda.size() + " images)\n"
        + "!pet - posts a random picture of a yeety pet, (" + pet.size() + " images)\n"
        + "!petadd - attach an image to add it to the pool of pet images, if the bot didn't react (positively), it didn't get added\n"
        + "!randomyeet - random image from yeety commons, (" + temp.size() +" images)\n"
        + "!tpose - random tpose , (" + tpose.size() + " images)\n"
        + "!tposeadd - add to the collection of tposes\n"
         +"!vibecheck - do you even gotta ask what this posts?\n"
         + "!yeetquote - posts a random message from yeety \n"
        )).subscribe();

        // below here starts bot-user specific interactions
        

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> user.getId()).isPresent() 
        && message.getAuthor().map(user -> user.getId()).get().asLong() == 411684425475293206L)//ellie is angy
        .filter(message -> message.getContent().orElse("").contains("angy"))
        .subscribe(message -> 
            message.addReaction(ReactionEmoji.custom(Snowflake.of(623913365651062784L), "angy", false)).subscribe());

    client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getAuthor().map(user -> user.getId()).isPresent()
            && message.getAuthor().map(user -> user.getId()).get().asLong() == 348322302888378368L)// brian is feeling extreme
        .subscribe(message -> { saveMessage("brian",message.getContent().orElse(null));
            System.out.println("Saving brian message"); });


         
//post message in response to specific user in specific channel. with specfici text
client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getChannelId().asLong() == 541833277967695882L)//max channe
        .filter(message -> message.getAuthor().map(user -> user.getId()).isPresent() 
        && message.getAuthor().map(user -> user.getId()).get().asLong() == 207705413892702208L)//max is dividing
        .filter(message -> message.getContent().orElse("").contains("ahhh"))
        .subscribe(message -> {
          if(count < 1) {
            message.addReaction(ReactionEmoji.custom(Snowflake.of(548037348965875713L), "aaaaahhhhhhhhhhhhhhhhhhhhhhhhhh", false)).subscribe();
            message.getChannel().subscribe(channel -> ((MessageChannel) channel).createMessage(spec -> {
          spec.setContent("MAX STOP DIVIDING!!!!");}).subscribe());
          count++;} }
            );

    client.login().block();
  }

 

  public static int count(String filename) throws IOException {
    InputStream is = new BufferedInputStream(new FileInputStream(filename));
    try {
      byte[] c = new byte[1024];
      int count = 0;
      int readChars = 0;
      boolean endsWithoutNewLine = false;
      while ((readChars = is.read(c)) != -1) {
        for (int i = 0; i < readChars; ++i) {
          if (c[i] == '\n')
            ++count;
        }
        endsWithoutNewLine = (c[readChars - 1] != '\n');
      }
      if (endsWithoutNewLine) {
        ++count;
      }
      return count;
    } finally {
      is.close();
    }
  }

public static void reverseFile(String filename)
{
  Object[] lines;
    try (Stream<String> lines2 = Files.lines(Paths.get(filename), StandardCharsets.UTF_16)) { // StandardCharsets.UTF_8
      lines = lines2.toArray();
      File file = new File("reverse"+filename);
      FileOutputStream ops = new FileOutputStream(file, true);
      BufferedWriter br = new BufferedWriter(new OutputStreamWriter(ops, StandardCharsets.UTF_16));
      
     
      for(int i = lines.length - 1;i>=0;i--)
  {
        br.write((String)lines[i] + "\n");
  }
      br.close();
      ops.close();
      lines2.close();
    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("Error reversing file");
    }
}

  public static void replaceFile(String filename) {
    Object[] lines;
    Pattern p = Pattern.compile("^.*: ");
    try (Stream<String> lines2 = Files.lines(Paths.get(filename), StandardCharsets.UTF_16)) { // StandardCharsets.UTF_8
      lines = lines2.toArray();
      File file = new File("replaced" + filename);
      FileOutputStream ops = new FileOutputStream(file, true);
      BufferedWriter br = new BufferedWriter(new OutputStreamWriter(ops, StandardCharsets.UTF_16));
      Matcher m = p.matcher((String)lines[0]);
      m.find();
      String currUser = m.group();
      ArrayList<String> newLines = new ArrayList<String>();
      newLines.add(cleanLine((String)lines[0]));
      for (int i = 1; i < lines.length -1; i++) {
        m = p.matcher((String)lines[i]);
        if(m.find())
        {
          String nextUser = m.group();
          if(nextUser.equals(currUser))
          {
            newLines.set(newLines.size() - 1, combineLine(newLines.get(newLines.size() - 1), (String) lines[i],currUser));
          } else{
            currUser = nextUser;
            newLines.add(cleanLine((String) lines[i])); 
          }
        } else
        {
          newLines.set(newLines.size()-1,combineLine(newLines.get(newLines.size()-1), (String)lines[i]));
        }
      }
      for(String line : newLines)
      {
        br.write(line + "\n");
      }
      br.close();
      ops.close();


    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("Error reversing file");
    }
  }


  public static String combineLine(String currLine, String nextLine) 
  {
    return currLine + " " + nextLine;
  }

  public static String combineLine(String currLine, String nextLine, String currUser)
  {
    return currLine + " " + cleanLine(nextLine);
  }

  public static String getUserQuote(String user)
  {
    Random rand = new Random();
    
    String line = "";
    try (Stream<String> lines = Files.lines(Paths.get(user + "log.txt"), StandardCharsets.UTF_16)) { //StandardCharsets.UTF_8
      int next = rand.nextInt(count(user + "log.txt"));
      System.out.println("Trying to get line " + next + " from " + user + "log.txt");
      line = lines.skip(next).findFirst().get();
    } catch (Exception e) {
      e.printStackTrace();
      System.out.println("Error reading line  from " + user + "log.txt");
    }
    return line;
  }
  public static String getRandomElement(List<String> list) {
    Random rand = new Random();
    if(list.size() == 0)
    {
      return "Nothing to post sorry.";
    }
    return list.get(rand.nextInt(list.size()));
  }

  public static boolean saveImages(String directory, ArrayList<String> list, Message message) {
    int i = 0;
    Pattern p1 = Pattern.compile("(https?://)?(www.)?[^\\s]+\\.(com|net|gg|edu|org|co|us|gov|edu|uk)(/[^\\s]*)?");
    Pattern p = Pattern.compile("\\.(png|mov|jpg|jpeg|mp4|gif|jiff|webm|avi|webp)");
    String temp1 = message.getContent().orElse(null);
    if(temp1 != null)
    {
      Matcher m1 = p1.matcher(temp1);
      while(m1.find())
      {
        String url1 = m1.group();
      Matcher m = p.matcher(url1);
       String name = directory + list.size();
      if(m.find()) {
          name += m.group();
        if(saveUrlFile(directory, url1, name)) 
      {
        list.add(name);
        i++;
      }
    }
  }
}
    for (Attachment temp : message.getAttachments()) {
      String url1 = temp.getUrl();
      Matcher m = p.matcher(url1);
       String name = directory + list.size();
      if(m.find()) {
        name += m.group();
      if(saveUrlFile(directory, url1, name)) 
      {
          list.add(name);
        i++;
      }
      } else { 
        System.out.println("did not save " + name);
      }
    }
    if(i > 0)
    {
      return true;
    }
    return false;

  }




  public static void saveChannel(String channel, String user, String content) {
    if (user == null || content == null || isCommand(content)) {
      return;
    }
    content = replaceMention(content).replace('\n', ' ');
    String temp = "\n" + user + ": " + content;
    try {
      File file = new File(channel + "ChannelLog.txt");
      FileOutputStream ops = new FileOutputStream(file,true);
      BufferedWriter br = new BufferedWriter(new OutputStreamWriter(ops,StandardCharsets.UTF_16));
      br.write(temp);
      br.close();
      ops.close();
    } catch (Exception e) {
      System.out.println("Unexpected expection when saving message");
    }

  }

  public static void saveChannel(String channel, String content) {
    if (content == null || isCommand(content)) {
      return;
    }
    content = replaceMention(content).replace('\n', ' ');
    String temp = "\n" + content;
    try {
      File file = new File(channel + "ChannelLog.txt");
      FileOutputStream ops = new FileOutputStream(file,true);
      BufferedWriter br = new BufferedWriter(new OutputStreamWriter(ops,StandardCharsets.UTF_16));
      br.write(temp);
      br.close();
      ops.close();
    } catch (Exception e) {
      System.out.println("Unexpected expection when saving message");
    }

  }


  

  public static void saveMessage(String user, String s)
  {
    if (s == null || isCommand(s)) {
      return;
    }
    try {
      s = replaceMention(s).replace('\n', ' ');
    String temp = "\n" + user + ": " + s;
    File file = new File(user + "log.txt");
      FileOutputStream ops = new FileOutputStream(file, true);
      BufferedWriter br = new BufferedWriter(new OutputStreamWriter(ops, StandardCharsets.UTF_16));
      br.write(temp);
      br.close();
      ops.close();
    } catch (Exception e) {
      System.out.println("Unexpected expection when saving message");
    }
  }

  

  public static int saveListL(String name, ArrayList<Long> list) {
    lastHofid = list.get(0);
    lastGallid = list.get(1);
    brianLogID = list.get(2);
    lastYeetsID = list.get(3);
    try {
      File dir = new File("list");
      File file2 = new File(dir, name + "list.txt");
      FileOutputStream fileOut = new FileOutputStream(file2);
      ObjectOutputStream objectOut = new ObjectOutputStream(fileOut);
      file2.createNewFile();
      objectOut.writeObject(list);
      objectOut.close();
      System.out.println("The " + name + " Object  was succesfully written to a file");
      return 1;
    } catch (Exception e) {
      System.out.println("Critical error! List not saved sucessfully to \\list\\" + name + "list.txt");
      return 0;
    }
  }

  public static FileInputStream postFile(String directory, String temp)
  {
    System.out.println("Posting file " + temp + " from directory: " + directory);
    try {
      File dir = new File(directory);
      if (!dir.exists()) {
        dir.mkdir();
      }
      System.out.println(temp);
      File file2 = new File(dir, temp);
      FileInputStream fileIn = new FileInputStream(file2);
     return fileIn;
    } catch (Exception e) {
        System.out.println("Could not post file");
        return null;
      }
    }

    public static String replaceMention(String s)
    {
      String curr = s;
      Pattern p = Pattern.compile("<@[!&]?[0-9]+>");
      Matcher m = p.matcher(curr);
      ArrayList<String> temp = new ArrayList<String>();
      while(m.find())
      {
        temp.add(m.group());
      }
      while(!temp.isEmpty())
      {
        long d = mentionToID(temp.get(0));
        curr = m.replaceFirst("@" + getKey(d));
        temp.remove(0);
        m = p.matcher(curr);
      }
      return curr;
    }

    public static String cleanLine(String s) {
    String curr = s;
    Pattern p = Pattern.compile("^.*: ");
    Matcher m = p.matcher(curr);
     if(m.find()){
      curr = m.replaceFirst("");
    }
    return curr;
  }


    public static boolean isCommand(String s)
    {
      if(s.equalsIgnoreCase("!bread") || s.equalsIgnoreCase("!hof") || s.equalsIgnoreCase("!memories") || s.equalsIgnoreCase("!norland") || s.equalsIgnoreCase("!panda") 
      || s.equalsIgnoreCase("!pet") || s.startsWith("!petadd") || s.equalsIgnoreCase("!randomyeet") || s.equalsIgnoreCase("!tpose") || s.equalsIgnoreCase("!tposeadd") || s.equalsIgnoreCase("!vibecheck"))
      {
        return true;
      }

      if(s.matches("![A-Za-z]+quote[s]*"))
      {
        return true;
      }
      return false;
    }
    public static long mentionToID(String mention)
    {
      Pattern p = Pattern.compile("[0-9]+");
      Matcher m = p.matcher(mention);
      m.find();
      return Long.parseLong(m.group());
    }
  

    public static String getKey(long d)
    {
      Set<String> set = userMap.keySet();
      for(String s : set)
      {
        if(userMap.get(s) == d)
          return s;
      }
      return "Unknown user";

    }
public static boolean saveUrlFile(String directory, String url1, String name)
{
    try {
        System.out.println("Save to " + directory + "/" + name);
        File dir = new File(directory);
        File file2 = new File(dir, name);
        BufferedInputStream inputStream = new BufferedInputStream(
            (new URI(url1)).toURL().openStream());
        FileOutputStream fileOS = new FileOutputStream(file2); 
      byte data[] = new byte[1024];
      int byteContent;
      while ((byteContent = inputStream.read(data, 0, 1024)) != -1) {
        fileOS.write(data, 0, byteContent);
      }
      fileOS.close();
    return true;
    } catch (Exception e) {
      System.out.println("Couldn't save urlL " + url1);
      return false;
    }
}


  public static ArrayList<String> initalizeList(String name) {
    ArrayList<String> list = new ArrayList<String>();
    System.out.println("Loading " + name +  " bank");
    try {
      hof = new ArrayList<String>();

File[] files = new File("./" + name + "/").listFiles();
//If this pathname does not denote a directory, then listFiles() returns null. 
for (File file : files) {
    if (file.isFile()) {
        list.add(file.getName());
    }
}
    } catch (Exception e) {
      System.out.println("Can't load " + name + " list Creating empty list.");
      list = new ArrayList<String>();
    }
    return list;
  }

  public static ArrayList<Long> initalizeListL(String name) {
    ArrayList<Long> list;
    System.out.println("Loading " + name + " bank");
    try {
      File dir = new File("list");
      if (!dir.exists()) {
        dir.mkdir();
      }
      File file2 = new File(dir, name + "list.txt");
      FileInputStream fileIn = new FileInputStream(file2);
      ObjectInputStream objectIn = new ObjectInputStream(fileIn);
      list = (ArrayList<Long>) objectIn.readObject();
      objectIn.close();
    } catch (Exception e) {
      System.out.println("Can't load " + name + " list Creating empty list.");
      list = new ArrayList<Long>();
      int num = 2;
      for(int i = 0; i < num; i++)
      {
      list.add(i,Long.valueOf(0));
      }
      int trySave = saveListL(name, list);
      if (trySave == 0) {
        System.out.println("Couldn't initalize list. Exiting");
        System.exit(0);
      }
    }
    return list;
  }

  public static HashMap<String, Long> initalizeUserMap() {
    HashMap<String, Long> list;
    System.out.println("Loading user  bank");
    try {
      File dir = new File("list");
      if (!dir.exists()) {
        dir.mkdir();
      }
      File file2 = new File(dir, "maplist.txt");
      FileInputStream fileIn = new FileInputStream(file2);
      ObjectInputStream objectIn = new ObjectInputStream(fileIn);
      list = (HashMap<String, Long>) objectIn.readObject();
      objectIn.close();
    } catch (Exception e) {
      System.out.println("Can't load user bank list Creating empty list.");
      list = new HashMap<String, Long>();
      userMap = list;
      saveUserMap();
    }
    return list;
  }

  public static HashMap<String, Boolean> initalizeIsLoggedMap() {
    HashMap<String, Boolean> list;
    System.out.println("Loading user logged bank");
    try {
      File dir = new File("list");
      if (!dir.exists()) {
        dir.mkdir();
      }
      File file2 = new File(dir, "isLoggedMap.txt");
      FileInputStream fileIn = new FileInputStream(file2);
      ObjectInputStream objectIn = new ObjectInputStream(fileIn);
      list = (HashMap<String, Boolean>) objectIn.readObject();
      objectIn.close();
    } catch (Exception e) {
      System.out.println("Can't load user bank list Creating empty list.");
      list = new HashMap<String, Boolean>();
      isLoggedMap = list;
      saveIsLoggedMap();
    }
    return list;
  }
  public static void saveUserMap(){
  try

  {
    File dir = new File("list");
    File file2 = new File(dir, "maplist.txt");
    FileOutputStream fileOut = new FileOutputStream(file2);
    ObjectOutputStream objectOut = new ObjectOutputStream(fileOut);
    file2.createNewFile();
    objectOut.writeObject(userMap);
    objectOut.close();
    System.out.println("The  users posts  Object  was succesfully written to a file");
  }catch(
  Exception e)
  {
    System.out.println("Critical error! List not saved sucessfully to \\list\\maplist.txt");

  }
}

  public static void saveIsLoggedMap() {
    try

    {
      File dir = new File("list");
      File file2 = new File(dir, "isLoggedMap.txt");
      FileOutputStream fileOut = new FileOutputStream(file2);
      ObjectOutputStream objectOut = new ObjectOutputStream(fileOut);
      file2.createNewFile();
      objectOut.writeObject(isLoggedMap);
      objectOut.close();
      System.out.println("The  users posts  Object  was succesfully written to a file");
    } catch (Exception e) {
      System.out.println("Critical error! List not saved sucessfully to \\list\\maplist.txt");

    }
  }

  public static void playGame(DiscordClient client, Snowflake server, TextChannel gameChannel, String quotes)
  {
    ArrayList<Player> players = new ArrayList<Player>();

        gameChannel.createMessage(spec -> spec.setContent("Starting the quote game. You have 1 minute to join by typing !joingame"))
        .subscribe();
         long timeNow = System.currentTimeMillis();
               client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getChannelId().asLong() == gameChannel.getId().asLong())
        .filter(message -> message.getContent().orElse("").equalsIgnoreCase("!joingame")).take(Duration.ofSeconds(60L))
        .subscribe(message-> {
            if(message.getAuthor().isPresent())
            {
                message.getAuthor().orElse(null).asMember(server).subscribe(member -> players.add(new Player(member)));
                System.out.println("this person joined:" + message.getAuthor().orElse(null).getUsername());
            }
          });

          while (System.currentTimeMillis() - timeNow < (61000)) {
            // busy waiting YIKES, but I don't think it can be helped
          }
            gameChannel.createMessage( 
                spec -> {
                  String users = "";
                  for(Player player: players)
                      users = users + ", " + player.getName();

                   spec.setContent("The quote game will begin now. We are playing with users:" + users); })
            .subscribe();

            

            for(Player player : players)
            {
              for(int i = 0; i < 6; i++)
              {
                player.addCard(getUserQuote(quotes));
              }
            }

              
              boolean gameIsOn = true;
          String winner = "Nobody";
          ArrayList<Integer> scores = new ArrayList<Integer>(players.size());
          for (int i = 0; i < players.size(); i++) {
            scores.add(0);
          }
          while (gameIsOn) {
            int roundWinner = playRound(client, gameChannel, players,quotes);
            scores.set(roundWinner, scores.get(roundWinner) + 1);
            String scoreReport = "The current score is as follows:";
             for(int i = 0; i < scores.size(); i++)
              {
                scoreReport += "\n" + players.get(i).getName() + " has " + scores.get(i) + " pts";
              }
              gameChannel.createMessage(scoreReport).subscribe();
            for (int i = 0; i < scores.size(); i++) {
              if (scores.get(i) == 5) {
                winner = players.get(i).getName();
                gameIsOn = false;
              }

            }

          }
                  String scoreReport = "The game has finished! " + winner + " is the winner! The final scores were as follows:";
             for(int i = 0; i < scores.size(); i++)
              {
                scoreReport += "\n" + players.get(i).getName() + " had " + scores.get(i) + " pts";
              }
            gameChannel.createMessage(scoreReport).subscribe();
  }

  public static int playRound(DiscordClient client, TextChannel gameChannel, ArrayList<Player> players, String quotes) 
  {
    final String quote1 = getUserQuote(quotes);
    final String quote2 = getUserQuote(quotes);
    String story = quote1 + "\n" + quote2;
    final String prompt = "Please finish this conversation with a quote from your hand: \n" + quote1 + "\n" + quote2;
    gameChannel.createMessage(prompt).subscribe();
    for(Player player : players)
    {
      player.addCard(getUserQuote(quotes));
      player.getAsMember().getPrivateChannel().subscribe(channel -> {
        channel.createMessage(prompt + "\n" + player.printHand() + "\n Respond with the number corresponding to your quote[1-7]").subscribe(); 
        getQuoteFromPlayer(client, player, channel);
      } );
    }
    long timeNow = System.currentTimeMillis();
    while (System.currentTimeMillis() - timeNow < (61000)) {
      // busy waiting YIKES, but I don't think it can be helped
    }

    ArrayList<PlayerCard> cards = printResponses(client, gameChannel, players,story);
    return playersVote(client, gameChannel, players, cards,story);
  }

   public static ArrayList<PlayerCard> printResponses(DiscordClient client, TextChannel gameChannel, ArrayList<Player> players, String story)
    {
        ArrayList<PlayerCard> temp = new ArrayList<PlayerCard>();
        ArrayList<PlayerCard> cards = new ArrayList<PlayerCard>();

        for(Player player : players)
        {
            temp.add(new PlayerCard(player,player.getPlayedCard()));
        }
        while(!temp.isEmpty())
        {
            Random random = new Random();
            int r = random.nextInt(temp.size());
            cards.add(temp.remove(r));
        }
            gameChannel.createMessage( spec -> { 
        String s = "Here are the received responses: \n";
        for(int i = 0; i < cards.size(); i++)
        {
            s += "[" + (i+1) + "]" + cards.get(i).getQuote() + "\n";
        }
        s += "\n Remember the conversations was: \n" + story;
        spec.setContent(s);} ).subscribe();
        return cards;
    }


      public static int playersVote(DiscordClient client, TextChannel gameChannel, ArrayList<Player> players, ArrayList<PlayerCard> cards, String story)
    {
        gameChannel.createMessage(spec -> spec.setContent("Please vote for your favorite quote(not yours!!) to complete the conversation. Use the corresponding number. Use the format !vote[num]. Do not include brackets"))
        .subscribe();

        HashMap<Snowflake, Boolean> didVote = new HashMap<Snowflake,Boolean>();
        ArrayList<Integer> votesFor = new ArrayList<Integer>();
        for(Player player: players)
        {
            votesFor.add(0);
            didVote.put(player.getAsMember().getId(),false);
        }
                long timeNow = System.currentTimeMillis();
       client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getChannelId().asLong() == gameChannel.getId().asLong())
        .filter(message -> message.getContent().orElse("").matches("!vote[0-9]+")).take(Duration.ofSeconds(60L))
          .subscribe(s -> {
            Snowflake playerID = s.getAuthor().orElse(null).getId();
             if(!didVote.getOrDefault(playerID,true))
        {
                int temp =  Integer.parseInt(s.getContent().orElse("0000000000000000000000").substring(5)) - 1;
                if(cards.get(temp).getOwner().getAsMember().getId().asLong() != playerID.asLong())
                {
                    votesFor.set(temp,votesFor.get(temp) + 1);
                    didVote.put(playerID,true);
                }
            }
        });
    
    while(System.currentTimeMillis() - timeNow < (62000))
    {
        //busy waiting YIKES, but I don't think it can be helped
    }
    int maxPos = -1;
    int max = -1;

    for(int i = 0; i < votesFor.size() ; i++)
    {
        if(votesFor.get(i) > max)
        {
            max = votesFor.get(i);
            maxPos = i;
        }
    }
     Player winner = cards.get(maxPos).getOwner();
     String print = winner.getName()  + " was the winner. The complete conversation is: \n" + story + "\n" + cards.get(maxPos).getQuote();
     gameChannel.createMessage(print).subscribe();
     for(int i = 0; i < players.size(); i++)
     {
       if(players.get(i).equals(winner))
          return i;
     }
     System.out.println("Something weird happened");
     return -1;//something weird happened

    }

  public static void getQuoteFromPlayer(DiscordClient client , Player player, PrivateChannel channel)
  {

        client.getEventDispatcher().on(MessageCreateEvent.class).map(MessageCreateEvent::getMessage)
        .filter(message -> message.getChannelId().asLong() == channel.getId().asLong())
        .filter(message -> message.getContent().orElse("").matches("[1-7]"))
        .take(Duration.ofSeconds(60L)).subscribe(message -> {
              try {
                int i = Integer.parseInt(message.getContent().orElse("-1"));
                if(i > 0 && i < 8)
                {
                   player.setPlayCard(i-1);
                }
                else
                {
                  channel.createMessage(spec -> spec.setContent("Invalid reponse, please pick a number corresponding to your card [1-7]")).subscribe(); 
                }
              } catch (Exception e)
              {
                channel.createMessage(
                    spec -> spec.setContent("Invalid reponse, please pick a number corresponding to your card [1-7]"))
                .subscribe();
              }
          
        });

  }


  public static String getBotResponse(String message)
  {
    Pattern p = Pattern.compile("<@[!&]?" + botID + ">");
    Matcher m = p.matcher(message);
    message = m.replaceFirst("");
    message = replaceMention(message);
    System.out.println("Responding to " + message);
    try {
      long timeNow = System.currentTimeMillis();
    Process process = Runtime.getRuntime().exec("python chatBot.py " + message);
    System.out.println("Waiting for process");
    process.waitFor();
    System.out.println("This took " + (System.currentTimeMillis() - timeNow)+ " ms");
      String line = "";
     Stream<String> lines = Files.lines(Paths.get("chatbot.txt"), StandardCharsets.UTF_16);
        System.out.println("Trying to read from chatbot.txt");
        line = lines.findFirst().get();
    System.out.println(line);
    lines.close();
    return line;
      } catch (Exception e)
    {
      return "Error getting response";
    }
  }
}

