
/**
 * Write a description of class test here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.io.*;
public class test
{
    public static void main(String args[]) throws FileNotFoundException, Exception
    {
        HuffmanCoding n = new HuffmanEncoder();
        String s = n.getFrequencies(new File("C:\\Users\\Mike\\Downloads\\school\\HuffingtonAlgo\\illiad.txt"));
        HuffTree test = n.buildTree(new File("C:\\Users\\Mike\\Downloads\\school\\HuffingtonAlgo\\illiad.txt"));
        String s2 = n.traverseHuffmanTree(test); 
        String str;
        BufferedReader reader = new BufferedReader(new StringReader(s));
        BufferedReader reader2 = new BufferedReader(new StringReader(s2));
        try {
            while ((str = reader.readLine()) != null) {
                if (str.length() > 0) 
                {
                    char t1 = str.charAt(0);
                    int i = Integer.parseInt(str.substring(2));
                    System.out.println(t1 + ": " + i);
                }
            }
            
            while ((str = reader2.readLine()) != null) {
                if (str.length() > 0) 
                {
                    char t1 = str.charAt(0);
                    String i = str.substring(2);
                    System.out.println(t1 + ": " + i);
                }
            }

        } catch(IOException e) {
            e.printStackTrace();
        }
        
         System.out.println("Starting encoding");
        String test2 = n.encodeFile(new File("C:\\Users\\Mike\\Downloads\\school\\HuffingtonAlgo\\illiad.txt"), test);
        System.out.println("Starting decoding");
        String test3 = n.decodeFile(test2,test);
        
        System.out.println(test3);
}
}
