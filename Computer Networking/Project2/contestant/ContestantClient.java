import java.util.regex.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.Exception;
import java.io.IOException;
import java.net.Socket;

public class ContestantClient {
    public static Socket socket;
    public static String nickname;
    public static void main(String args[]) {
        String hostName = args[0];
        int portNumber = Integer.parseInt(args[1]);
        try {
            socket = new Socket(hostName, portNumber);
           
        } catch (Exception e) {
            System.out.println("Cannot connect to" + hostName + "on " + portNumber);
            System.out.println("Closing client");
            System.exit(0);
        }
        try {
        ObjectOutputStream os = new ObjectOutputStream(socket.getOutputStream());
        ObjectInputStream is = new ObjectInputStream(socket.getInputStream());
        Scanner in = new Scanner(System.in);

        Object res1 = is.readObject();
         if (res1 instanceof NicknameResponse) {
             System.out.print("Enter your nickname: ");
            nickname = in.nextLine();
            os.writeObject(new NicknameRequest(nickname));
         }
        while(true) {
                res1 = is.readObject();
                if (res1 instanceof NicknameResponse) {
                    if (!((NicknameResponse)res1).getResponseStatus()) {
                        System.out.println("Nickname in use. Try again.");
                         System.out.print("Enter your nickname: ");
                         nickname = in.nextLine();
                         os.writeObject(new NicknameRequest(nickname));
                    }
                    else
                    {
                        break;
                    }
                } else
                {
                    continue;
                }
        
        }
        System.out.println("Hello " + nickname + ", get ready for the contest!");
            boolean check = true;
        while(check)
        {
            Object temp = is.readObject();
            if(temp instanceof Response){
                Response res = (Response) temp;
                if(res instanceof SendQuestion)
                {
                    Question q = ((SendQuestion)res).getQuestion();
                    q.printQuestionQuiz();
                    System.out.print("Enter your choice: ");
                    String choice = in.nextLine();
                    os.writeObject(new SendAnswer(choice.charAt(0)));
                } else if(res instanceof AnswerResponse)
                {
                    System.out.println(((AnswerResponse)res).getResText());
                } else if(res instanceof ContestOver)
                {
                    System.out.println("The contest is over - thanks for playing " + nickname);
                check = false;
                }
            }
        }


    }  catch (Exception e) {
            System.out.println("Cannot connect to" + hostName + "on " + portNumber);
            System.out.println("Closing client");
            System.exit(0);
        }
    }
}