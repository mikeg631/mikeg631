
/**
 * Write a description of class f here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class f
{
    public void test()
    {
    


public String decodeFile(String code, HuffTree huffTree) throws Exception
    {
        BufferedReader buffer = new BufferedReader( new StringReader(code));

        String temp = "";
        String str;
        String[] huffCodes = new String[95];
        char[] codes = new char[95];
        String s = traverseHuffmanTree(huffTree);
        BufferedReader reader = new BufferedReader(new StringReader(s));
        int i = -1; 
        while ((str = reader.readLine()) != null) {
            i++;
            huffCodes[i] = str.substring(2);
            codes[i] = str.charAt(0);
        }

        try {
            int c = 0;
            String temp2 = "";
            while((c = buffer.read()) != -1) {
                if(c > 31)
                {
                    temp2 += (char)c;
                }
            }
            while(temp2.length() > 0)
            {
                int j = 0;
                boolean notFound = true;
                while(j < i && notFound)
                {
                    if(temp2.startsWith(huffCodes[j]))
                    {
                        temp += codes[j];
                        temp2 = temp2.substring(huffCodes[j].length());
                        notFound = false;
                    }
                    j++;
                }
            }
        } catch(IOException e) {
            e.printStackTrace();
        }
        catch(Exception d) {
            d.printStackTrace();
        }

        return temp;
    }
}


 public String encodeFile(File inputFile, HuffTree huffTree) throws FileNotFoundException
    {
        BufferedReader buffer = new BufferedReader( new InputStreamReader( new FileInputStream(inputFile)));

        String temp = "";
        String str;

        
        int i = -1; 
        try{
            String s = traverseHuffmanTree(huffTree);
            BufferedReader reader = new BufferedReader(new StringReader(s));
            while ((str = reader.readLine()) != null) {
                if (str.length() > 0) 
                {
                    huffCodes[((int)str.charAt(0))] = str.substring(2);
                }
            }

            int c = 0;
            while((c = buffer.read()) != -1) {
                if(c > 31)
                {
                    int j = 0;
                    boolean notFound = true;
                    while (j < i && notFound) { 

                        if(codes[j] == (char)c)
                        {
                            temp += huffCodes[j];
                            notFound = false;
                        }
                        j++;
                    }
                }
            }

        } catch(IOException e) {
            e.printStackTrace();
        }
        catch(Exception d) {
            d.printStackTrace();
        }
        System.out.println(temp);

        return temp;
    }
    


 
