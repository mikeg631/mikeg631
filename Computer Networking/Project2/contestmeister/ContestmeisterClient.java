import java.util.regex.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.Exception;
import java.io.IOException;
import java.net.Socket;
import java.io.File;
import java.io.FileNotFoundException;

public class ContestmeisterClient {
    public static Socket socket;

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
        System.out.println("Connected to:" + hostName + " on " + portNumber);

        if (args.length > 2) {
            File file = new File(args[2]);
            try {
                Scanner in = new Scanner(file);
                readFile(in);
                in.close();
            } catch (FileNotFoundException e) {
                System.out.println("Error input file: " + args[2] + "not found. Continuing in interactive mode");
            }
        }
        Scanner in = new Scanner(System.in);

        while (true) {
            System.out.print("> ");
            String s = in.nextLine();
            if(s.length() < 1)
            {
                continue;
            }
            String command = s.substring(0, 1);
            String commandArgs = s.substring(1);

            switch (command) {
            case "p":
             if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        makeQuestion(Integer.parseInt(m.group()),in);

                    } else {
                        System.out.println("Error. Please enter a number");
                    }
                }
                break;
            case "g":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        Question q;
                        q = getCommand(Integer.parseInt(m.group()));
                        if (q != null) {
                            q.printQuestion();
                            System.out.println(q.getCorrectAnswer());
                        }
                    } else {
                        System.out.println("Error. Please enter a number");
                    }

                }
                break;
                case "a":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        int contest = Integer.parseInt(m.group());
                        if (m.find()) {
                            int question = Integer.parseInt(m.group());
                            appendCommand(contest,question);
                        } else {
                            System.out.println("Follow the format a <contest number> <question number>");
                        }
                    } else {
                        System.out.println("Follow the format a <contest number> <question number>");
                    }

                }
                break;
            case "d":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        deleteCommand(Integer.parseInt(m.group()));
                    } else {
                        System.out.println("Error. Please enter a number");
                    }
                }

                break;
            case "r":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        reviewCommand(Integer.parseInt(m.group()));

                    } else {
                        System.out.println("Error. Please enter a number");
                    }

                }
                break;
                case "s":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        setCommand(Integer.parseInt(m.group()));

                    } else {
                        System.out.println("Error. Please enter a number");
                    }

                }
                break;
                case "b":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        beginCommand(Integer.parseInt(m.group()));

                    } else {
                        System.out.println("Error. Please enter a number");
                    }

                }
                break;
            case "k":
                killCommand();
                break;
                case "l":
                listCommand();
                break;
            case "q":
                quitCommand();
                break;
            case "h":
                printHelp();
                break;
            case "\r":
            break;
            default:
                System.out.println("Error invalid command. See enter h for help");
                break;

            }
        }
    }

    public static void appendCommand(int cNum, int qNum)
    {
        Response res = sendRequest(new AppendRequest(cNum, qNum) );
        if (res instanceof BadResponse) {
            System.out.println(((BadResponse) res).getError());
        } else if (res == null) {
            System.out.println("Unkown error!!");// This shouldn't happen
            return;
        } else if (res instanceof AppendResponse) {
            String s = ((AppendResponse)res).getResText();
            System.out.println(s);
        } else {
            System.out.println("Unexpected Response!");
        }
    }

    public static void listCommand()
    {
        Response res = sendRequest(new ListRequest());
        if (res instanceof BadResponse) {
            System.out.println(((BadResponse) res).getError());
        } else if (res == null) {
            System.out.println("Unkown error!!");// This shouldn't happen
        } else if(res instanceof ListResponse)
        {
            System.out.println(((ListResponse)res).getList());
        } else {
            System.out.println("Unexpected Response!");
        }
    }

    public static void reviewCommand(int cNum) {
        Response res = sendRequest(new ReviewRequest(cNum));
        if (res instanceof BadResponse) {
            System.out.println(((BadResponse) res).getError());
        } else if (res == null) {
            System.out.println("Unkown error!!");// This shouldn't happen
        } else if (res instanceof ReviewResponse) {
            System.out.println(((ReviewResponse) res).getReview());
        } else {
            System.out.println("Unexpected Response!");
        }
    }

    public static void beginCommand(int cNum) {
        Response res = sendRequest(new BeginRequest(cNum));
        if (res instanceof BadResponse) {
            System.out.println(((BadResponse) res).getError());
        } else if (res == null) {
            System.out.println("Unkown error!!");// This shouldn't happen
            return;
        } else if (res instanceof BeginResponse) {
            if(res.getResponseStatus())
            {
                System.out.println("Contest " + cNum + " began on port " + ((BeginResponse)res).getContestPort());
            }
            else
            {
                System.out.println("Contest " + cNum + " doesn't exist");
            }
        } else {
            System.out.println("Unexpected Response!");
        }
    }
    public static void setCommand(int cNum) {
        Response res = sendRequest(new SetRequest(cNum));
        if (res instanceof BadResponse) {
            System.out.println(((BadResponse) res).getError());
        } else if (res == null) {
            System.out.println("Unkown error!!");// This shouldn't happen
            return;
        } else if (res instanceof SetResponse && res.getResponseStatus()) {
            System.out.println("Contest " +cNum + " is set");
        }
            else if (res instanceof SetResponse && !res.getResponseStatus()) {
                System.out.println("Error: Contest " + cNum + " already exists");
        } else {
            System.out.println("Unexpected Response!");
        }
    }

    public static void makeQuestion(int qNum, Scanner in) {
        String questionTag = in.nextLine();
        String question = in.nextLine();
        String s = in.nextLine();
        ArrayList<String> choices = new ArrayList<String>();
        char correct = 'a';
        while (!s.equals(".")) {
            question = question + "\n" + s;
            s = in.nextLine();
        }
        s = in.nextLine();
        while ((!s.equals("."))) {
            String choice = s;
            if (!choice.startsWith("(" + (char) (97 + choices.size()) + ") ")) {
                System.out.println("Error please start your choice with " + "(" + (char) (97 + choices.size()) + ")");
                s = in.nextLine();
                continue;
            }
            choice = choice.substring(3);
            s = in.nextLine();
            while (!s.equals(".")) {
                choice = choice + "\n" + s;
                s = in.nextLine();
            }
            choices.add(choice);
            s = in.nextLine();
        }
        if (choices.size() < 2) {
            System.out.println("You need at least two choices. Please try again.");
            return;
        }
        s = in.nextLine();
        while (true) {
            Pattern p = Pattern.compile("[a-z]$");
            Matcher m = p.matcher(s);

            if (s.length() == 1 && m.find()) {
                char temp = m.group().charAt(0);
                if (((int) temp - 97) <= (choices.size() - 1)) {
                    correct = temp;
                    break;
                }
            }
            System.out.println("Please enter a valid option as a lowercase char.");
            s = in.nextLine();

        }
            putQuestion(new Question(qNum, questionTag, question, choices, correct));
    
    }

    public static void makeQuestionFromFile(int qNum, Scanner in) {
        try {
            String questionTag = in.nextLine();
            System.out.println(questionTag);
            String question = in.nextLine();
            System.out.println(question);
            String s = in.nextLine();
            System.out.println(s);
            boolean fail = false;
            ArrayList<String> choices = new ArrayList<String>();
            char correct = 'a';
            while (!s.equals(".") && in.hasNextLine()) {
                question = question + "\n" + s;
                s = in.nextLine();
                System.out.println(s);
            }
            s = in.nextLine();
            System.out.println(s);
            while ((!s.equals(".")) && in.hasNextLine()) {
                String choice = s;
                if (!choice.startsWith("(" + (char) (97 + choices.size()) + ") ")) {
                    System.out
                            .println("Error please start your choice with " + "(" + (char) (97 + choices.size()) + ")");
                    s = in.nextLine();
                    System.out.println(s);
                    continue;
                }
                choice = choice.substring(3);
                s = in.nextLine();
                System.out.println(s);
                while (!s.equals(".") && in.hasNextLine()) {
                    choice = choice + "\n" + s;
                    s = in.nextLine();
                    System.out.println(s);
                }
                choices.add(choice);
                if (!in.hasNextLine()) {
                    fail = true;
                }
                s = in.nextLine();
                System.out.println(s);
            }
            if (choices.size() < 2) {
                System.out.println("You need at least two choices. Please try again.");
                return;
            }
            if (!in.hasNextLine()) {
                fail = true;
            }
            while (true && in.hasNextLine()) {
                s = in.nextLine();
                System.out.println(s);
                Pattern p = Pattern.compile("[a-z]$");
                Matcher m = p.matcher(s);
                if (s.length() == 1 && m.find()) {
                    char temp = m.group().charAt(0);
                    if (((int) temp - 97) <= (choices.size() - 1)) {
                        correct = temp;
                        break;
                    }
                }
                System.out.println("Please enter a valid option as a lowercase char.");
                if(!in.hasNextLine())
                {
                    fail = true;
                }

            }
            if(!fail)
            {
            putQuestion(new Question(qNum, questionTag, question, choices, correct));
            }
            else {
                System.out.println("Couldn't make question. Check for correct input format. Other commands potentially skipped as well.");           
             }

        } catch (Exception e) {
            System.out.println("Couldn't make question. Check for correct input format");
            return;
        }
    }

    public static Response sendRequest(Request req) {
        try {
            ObjectOutputStream os = new ObjectOutputStream(socket.getOutputStream());
            ObjectInputStream is = new ObjectInputStream(socket.getInputStream());
            try {
                os.writeObject(req);
                try {
                    Object res = is.readObject();
                    if (res instanceof Response) {
                        return (Response) res;
                    } else {
                        return new BadResponse(false, "Unrecongized response!");
                    }
                } catch (IOException e) {
                    return new BadResponse(false, "Couldn't get a response from the server.");
                } catch (ClassNotFoundException e) {
                    return new BadResponse(false, "Class not found. Invalid request!!");
                }
            } catch (IOException e) {
                return new BadResponse(false, "Error writing to Server. Server may have closed.");
            }
        } catch (IOException e) {
            return new BadResponse(false, "Error opening input and output stream.s Server may have closed");
        }
    }

    public static void deleteCommand(int questionNum) {
        // send request to server
        Response res = sendRequest(new DeleteRequest(questionNum));
        if (res instanceof BadResponse) {
            System.out.println(((BadResponse) res).getError());
        } else if (res == null) {
            System.out.println("Unkown error!!");// This shouldn't happen
            return;
        } else if (res instanceof DeleteResponse && res.getResponseStatus() == true) {
            System.out.println("Deleted question " + questionNum);
        } else {
            System.out.println("Unable to delete question, question number does not exist.");
        }
    }

    public static Question getCommand(int questionNum) {
        Response res = sendRequest(new GetRequest(questionNum));
        if (res instanceof BadResponse) {
            System.out.println(((BadResponse) res).getError());
            return null;
        } else if (res == null || res.getResponseStatus() == false) {
            System.out.println("Unable to get the question.");
            return null;
        } else if (res instanceof GetResponse && res.getResponseStatus() == true) {
            return ((GetResponse) res).getQuestion();
        }
        System.out.println("Unkown error!!");// This shouldn't happen
        return null;

    }

    public static void putQuestion(Question q) {
        Response res = sendRequest(new PutRequest(q));
        if (res instanceof BadResponse) {
            System.out.println(((BadResponse) res).getError());
        } else if (res == null || res.getResponseStatus() == false) {
            System.out.println("Unable to put the question.");
        } else if (res instanceof PutResponse && res.getResponseStatus() == true) {
            System.out.println(((PutResponse) res).getQuestionNum());
        }
    }


    public static void killCommand() {
        Response res = sendRequest(new KillRequest());
        if (res instanceof KillResponse && res.getResponseStatus()) {
            System.out.println("Server successfully killed");
            quitCommand();// Now quitting
        } else {
            System.out.println("Error killing the server!!");
            if (res instanceof BadResponse) {
                System.out.println(((BadResponse) res).getError());
            }
        }
    }

    public static void quitCommand() {
        try {
            socket.close();
        } catch (Exception e) {
            System.out.print("Error closing socket? Was it even open? ");
        } finally {
            System.out.println("Exiting client");
            System.exit(0);
        }
    }

    public static void printHelp() {
        System.out.println("Note brackets <> are used for  explaination purposes only. Do not enter them");
        System.out.println("Putting a question: use > p");
        System.out.println("<question tag>");
        System.out.println("<question> This can be multi-lined, finish by entering a period on the last line");
        System.out.println(
                "<choice> Must follow the format (a) <answer here> and go in alphabetical order. Can be multi-lined ended with period as above");
        System.out.println("Must enter at least two choices. Finish entering choicing with a period");
        System.out.println("Then enter the lowercase char of the right answer.");
        System.out.println("The question number will be printed");
        System.out.println();
        System.out.println("You can get questions by number by enterin > g <questionNumber>");
        System.out.println("Questions can be also recieved by entering > r");
        System.out.println("Random questions will prompt you to answer them");
        System.out.println(
                "You can also try to answer a question by using the command > c <question number> <char of answer>");
        System.out.println("You can also delete a question by via > d <question number>");
        System.out.println();
        System.out.println("You can close this client by entering > q");
        System.out.println("You can kill the server by entering > k");
        System.out.println("Bring this menua up via > h");

    }


    public static void readFile(Scanner in)
    {
        
        while (in.hasNextLine()) {
            System.out.print("> ");
            String s = in.nextLine();
            System.out.println(s);
            if(s.length() < 1)
            {
                continue;
            }
            String command = s.substring(0, 1);
            String commandArgs = s.substring(1);

            switch (command) {
            case "p":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        makeQuestionFromFile(Integer.parseInt(m.group()), in);

                    } else {
                        System.out.println("Error. Please enter a number");
                    }
                }
                break;
            case "g":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        Question q;
                        q = getCommand(Integer.parseInt(m.group()));
                        if (q != null) {
                            q.printQuestion();
                            System.out.println(q.getCorrectAnswer());
                        }
                    } else {
                        System.out.println("Error. Please enter a number");
                    }

                }
                break;
            case "a":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        int contest = Integer.parseInt(m.group());
                        if (m.find()) {
                            int question = Integer.parseInt(m.group());
                            appendCommand(contest, question);
                        } else {
                            System.out.println("Follow the format a <contest number> <question number>");
                        }
                    } else {
                        System.out.println("Follow the format a <contest number> <question number>");
                    }

                }
                break;
            case "d":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        deleteCommand(Integer.parseInt(m.group()));
                    } else {
                        System.out.println("Error. Please enter a number");
                    }
                }

                break;
            case "r":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        reviewCommand(Integer.parseInt(m.group()));

                    } else {
                        System.out.println("Error. Please enter a number");
                    }

                }
                break;
            case "s":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        setCommand(Integer.parseInt(m.group()));

                    } else {
                        System.out.println("Error. Please enter a number");
                    }

                }
                break;
            case "b":
                if (commandArgs.length() < 2) {
                    System.out.println("Error. Please enter a number");
                } else {
                    Pattern p = Pattern.compile("[0-9]+");
                    Matcher m = p.matcher(commandArgs.substring(1));
                    if (m.find()) {
                        beginCommand(Integer.parseInt(m.group()));

                    } else {
                        System.out.println("Error. Please enter a number");
                    }

                }
                break;
            case "k":
                killCommand();
                break;
            case "l":
                listCommand();
                break;
            case "q":
                quitCommand();
                break;
            case "h":
                printHelp();
                break;
            case "\r":
                break;
            default:
                System.out.println("Error invalid command. See enter h for help");
                break;

            }
        }
    }

}

