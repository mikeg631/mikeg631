
Michael Gordon Huffington Algorithim Commentary
I would say that I mostly learned about the algorithims in class. , however, during the project I leanred to appreciate the effiencey and eloquence of the
data structures introduced in this course. For example since minHeap is O(log n) it is great for insertion and deletion in this sort of senario. On top of appreciation, I learned
how to navigate the challenges of intregrating all of the data structures.

Data Structures used:
I used four data strucutes in this program. First I used a simple array to contain the frequencies of a character, where the index correpsonds to a character code. 
Secondly I used a Min Heap to store the Huffman Tree so that the program could properly build the Huffman tree. As expected, the entire algrothim needs a Huffman tree to work so 
thar was used as well. Lastly I used a stack to obtain codes from the Huffman tree as it could used to efficently and properly traverse the tree with recursion.

Computational complexity:
The computional complexity of the minheap operations are known to be on the order of O(log n), which is  the height of the tree. Getting the frequencies of the characters
will depend mostly on the amount of characters in a file as the code I developed must go through each character once, and then print the frequencies by treversing. 
The amount of charactrs is 95 so the adding to the String is on the O(1), and the entire algorithim is dominated by the O(n) where n is the characters in the input file.
Building a Huffman first requires the addition of all the characters to the minHeap as a tree, which is at most 95 in my program, but could be less. 
Adding the components to the Min heap removes 2 and adds one until there are 1 items left, so essentially it is on the O(n) where n is the number of characters to be encoded.
Since the amount of items in the tree is bounded by a constant this entire process is actually on O(1). 
Encoding the file is done by taking each character and retreving its code before printing it back to the string. Retreving the character and printing all take O(1), while the 
using each character in the file depends on the n characters in the file and is O(n)
Using the same logic, it can be seen that Deoding the file is on O(n) where n is the characters in the file.
Lastly, the traverseHuffmanTree using an alogorithim that involves recursive calls to print the code. Doing analysis I found the number of calls to the function is
 2n-1 where n is the characters stored in the tree. This  is explained by the fact that the tree should have 2n-1 nodes. This traversal is on the O(n), but again is limited by the characters.
