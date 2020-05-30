
/**
 * Write a description of class Huffman here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
import java.io.*;
import java.util.Stack;
import java.util.Collections;
import java.util.ArrayList;

public class HuffmanEncoder implements HuffmanCoding
{
    //take a file as input and create a table with characters and frequencies
    //print the characters and frequencies
    public String getFrequencies(File inputFile) throws FileNotFoundException
    {
        String s = "";
        int[] frequencies = new int[95];
        BufferedReader buffer = new BufferedReader( new InputStreamReader( new FileInputStream(inputFile)));
        int c = 0;
        try{
            while((c = buffer.read()) != -1) {
                if(c > 31)
                    frequencies[c-32]++;
            }
        }
        catch(IOException e )
        {}

        for(int i = 0; i < 95; i++)
        {
            if(frequencies[i] != 0)
                s  += (char)(i+32) + " " + frequencies[i] + "\n";
        }
        return s;
    }

    //take a file as input and create a Huffman Tree
    public HuffTree buildTree(File inputFile) throws FileNotFoundException, Exception
    {
        Heap minHeap = new Heap();
        BufferedReader buffer = new BufferedReader( new InputStreamReader( new FileInputStream(inputFile)));
        String s = getFrequencies(inputFile);
        String str;
        BufferedReader reader = new BufferedReader(new StringReader(s));
        try {

            while ((str = reader.readLine()) != null) {
                if (str.length() > 0) 
                {
                    minHeap.insert(new HuffTree(str.charAt(0), Integer.parseInt(str.substring(2))));
                }
            }

        } catch(IOException e) {
            e.printStackTrace();
        }

        HuffTree tmp1, tmp2, tmp3 = null;
        while (minHeap.size() > 1) { // While two items left
            tmp1 = minHeap.remove();
            tmp2 = minHeap.remove();
            tmp3 = new HuffTree(tmp1.root(), tmp2.root(),
                tmp1.weight() + tmp2.weight());
            minHeap.insert(tmp3);   // Return new tree to heap
        }

        return tmp3;   
    }

    //take a file and a HuffTree and encode the file.  
    //output a string of 1's and 0's representing the file
    public String encodeFile(File inputFile, HuffTree huffTree) throws FileNotFoundException
    {
        BufferedReader buffer = new BufferedReader( new InputStreamReader( new FileInputStream(inputFile)));
        String temp = "";
        String str;
        StringBuilder sb = new StringBuilder();//using this optimizes the code highly!!!!
        try {
            String s = traverseHuffmanTree(huffTree);
            BufferedReader reader = new BufferedReader(new StringReader(s));
            String[] huffCodes = new String[95];
            while ((str = reader.readLine()) != null) {//puts codes into table
                if (str.length() > 0) 
                {
                    huffCodes[((int)str.charAt(0))-32] = str.substring(2);
                }
            }
            int c = 0;
            while((c = buffer.read()) != -1) {
                if(c > 31)
                {
                        sb.append(huffCodes[c-32]);
                }
            }
        }
        catch(IOException e) {
            e.printStackTrace();
        }
        catch(Exception d) {
            d.printStackTrace();
        }
        temp = sb.toString();
        return temp;
    }

    //take a String and HuffTree and output the decoded words
    /**
     * Method decodeFile
     *
     * @param code A parameter
     * @param huffTree A parameter
     * @return The return value
     */
    public String decodeFile(String code, HuffTree huffTree) throws Exception
    {
        BufferedReader buffer = new BufferedReader( new StringReader(code));
        String temp = "";
        StringBuilder sb = new StringBuilder();
        String str;
        String[] huffCodes = new String[95];
        char[] codes = new char[95];
        String s = traverseHuffmanTree(huffTree);
        BufferedReader reader = new BufferedReader(new StringReader(s));
        int i = -1;
        HuffBaseNode root = huffTree.root();
        HuffBaseNode n = root;

        try {
            int c = 0;
            String temp2 = "";
            while((c = buffer.read()) != -1) {
                if(c > 31)
                {
                    if((char)c == '1')// go to left Node
                    {
                        n = ((HuffInternalNode)(n)).right();
                    }
                    else
                    {
                        n = ((HuffInternalNode)(n)).left();
                    }

                    if(n.isLeaf())
                    {
                        sb.append(((HuffLeafNode)n).value());
                        n = root;
                    }
                }
            }
        } catch(IOException e) {
            e.printStackTrace();
        }
        catch(Exception d) {
            d.printStackTrace();
        }
        temp = sb.toString();

        return temp;
    }
    
    //print the characters and their codes
    public String traverseHuffmanTree(HuffTree huffTree) throws Exception
    {
        Stack s = new Stack();
        HuffBaseNode root = huffTree.root();
        String temp = "";
        temp += getCodes(root, s);
        return temp;
    }

    public String getCodes(HuffBaseNode n ,Stack s)
    {
        if(n.isLeaf())
        {
            char symbol = ((HuffLeafNode)n).value();
            String code = "";
            for(Object c : s)
                code += c;
            return (symbol + " " + code + "\n");
        }
        HuffBaseNode left = ((HuffInternalNode)(n)).left();
        HuffBaseNode right= ((HuffInternalNode)(n)).right();
        s.push('0');
        String temp = getCodes(left, s);
        s.pop(); 

        s.push('1');
        temp += getCodes(right, s);
        s.pop(); 
        return temp;
    }

}

