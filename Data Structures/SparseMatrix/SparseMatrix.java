/**
 * 
 *
 * @author Michael Gordon
 * 
 */
import java.util.*;

public class SparseMatrix implements SparseInterface
{
    private int myRows, myCols;
    Node head; 

    /**
     * Constructor for objects of class SparseMatrix
     */
    public SparseMatrix()
    {
        head = null;
        myRows = 5;
        myCols = 5;
    }

    public SparseMatrix(int row, int col)
    {
        head = null;
        myRows = row;
        myCols = col;
    }

    public void clear()
    {
        head = null;// clears list of elements, all elements not in list are 0
    }

    /*
    Sets maximum size of the matrix.  Number of rows. Itshould also clear the matrix (make all elements 0)
     */
    public void setSize(int row, int col)
    {
        clear();
        myRows = row;
        myCols = col;
    }

    /*
    Adds an element to the row and column passed as arguments (overwrites if element is already present at that position).
    Throws an error if row/column combination is out of bounds.
     */
    public void addElement(int row, int col, int data)
    {
        if(row > (myRows-1) || col > (myCols-1))// program assumes an nxn matrix where 1st row is index 0, .... to nth row is n-1 index same for columns
        {
            throw new NullPointerException ("Error you are trying to add something outside of the bounds of the matrix");
        }
        if(data == 0)// no need to store 0 elements
        {
            removeElement(row,col);//incase there is an element there this overwrites it
            return;
        }
        Node node = new Node();
        node.data = data;
        node.row = row;
        node.col = col;
        if(head == null)
        {
            head = node;
            return;
        }
        Node find = head;
        if(head.row > row)// element needs to be added before head.
        {
            node.next = head;
            head = node;
            return;

        }
        if(head.row == row)
        {
            if(head.col > col)// element needs to be added before head.
            {
                node.next = head;
                head = node;
                return;
            }
            else if(head.col == col)// head is the element in question
            {
                head.data = data;
                return;
            }

        }

        while(find.next != null)
        {
            if(find.next.row < row)
            { 
                find = find.next;
            }
            else if(find.next.row == row)
            {
                if(find.next.col == col)// next node is the node in question and must be replaced
                {
                    find.next.data = data;
                    return;
                }
                else if(find.next.col > col)
                {
                    if(find.col == col && find.row == row)// element in question is find
                    {
                        find.data = data;
                        return;
                    }
                    else// next element is after the element that needs to be added.
                    {
                        node.next = find.next;
                        find.next = node;
                        return;
                    }
                } 
                else
                {
                    find = find.next;
                }
            }
            else if(find.next.row > row) //find is last element on this row
            {
                if(find.col == col && find.row == row)//find is element in question
                {
                    find.data = data;
                    return;
                }
                else// needs to be added after find 
                {
                    node.next = find.next;
                    find.next = node;
                }

            }

        }
        find.next = node; // should only be executed if this element's index position is further than any other's
    }

    /*
    Remove (make 0) the element at the specified row and column.
    Throws an error if row/column combination is out of bounds.
     */
    public void removeElement(int row, int col)
    {
        if(row > (myRows-1) || col > (myCols-1))
        {
            throw new NullPointerException ("Error you are trying to remove something outside of the bounds of the matrix");
        }
        if(head == null)//empty matrix, all elements are zero
        {
            return;
        }
        Node find = head;
        if(head.col == col && head.row == row)
        {
            head = head.next;
        }
        while(find.next != null)
        {
            if(find.next.row == row)
            {
                if(find.next.col == col)
                {
                    find.next = find.next.next;
                    return;
                }else if(find.next.col > col)
                {
                    return;//element has been passed, must be 0 already
                }
            }else if(find.next.row > row) 
            {
                return;//element has been passed, must be 0 already
            }
            find = find.next;   
        }
    }

    /*
    Return the element at the specified row and column
    Throws an error if row/column combination is out of bounds.
     */
    public int getElement(int row, int col)
    {
        if(row > (myRows-1) || col > (myCols-1))
        {
            throw new NullPointerException ("Error you are trying to get something outside of the bounds of the matrix");
        }
        Node find = head;
        if(head == null)
        {
            return 0;// everything in matrix is 0
        }

        while(find != null)
        {
            if(find.row == row)
            {
                if(find.col == col)
                {
                    return find.data;
                }else if(col > col)
                {
                    return 0;//element has been passed, must be 0
                }
            }else if(find.row > row) 
            {
                return 0;//element has been passed,not in linked list must be 0 
            }
            find = find.next;   
        }
        return 0; // if it has not been found it is 0
    }

    /*
    Should return the nonzero elements of your sparse matrix as a string.
    The String should be k lines, where k is the number of nonzero elements.
    Each line should be in the format "row column data" where row and column are the "coordinate" of the data and all are separated by spaces.
    An empty matrix should return an empty string.
    The print should be from left to right and from top to bottom (like reading a book) i.e. the matrix

    3 0 1
    0 2 0
    0 0 4

    Should print as:
    0 0 3
    0 2 1
    1 1 2
    2 2 4

     */
    public String toString()
    {
        String temp = "";
        Node print = head;
        while(print != null)
        {
            temp = temp + print.row + " " + print.col + " " + print.data + "\n";
            print = print.next;
        }
        return temp;
    }

    public int getNumRows()
    {
        return myRows;
    }

    public int getNumCols()
    {
        return myCols;
    }

    public SparseInterface addMatrices(SparseInterface matrixToAdd)
    {
        Node matrix1 = head;
        SparseInterface temp = new SparseMatrix();
        temp.setSize(matrixToAdd.getNumRows(),matrixToAdd.getNumCols());
        if(getNumRows() != matrixToAdd.getNumRows() || getNumCols() != matrixToAdd.getNumCols())//checks to see if this is valid addition
        {
            System.out.println("Error the matrices are not the same size and cannot be Added");
            return null;
        }
        for(int i = 0; i < matrixToAdd.getNumRows(); i++)//dumps all of the data from matrixToAdd into the matrix, any zero element would not be stored.
        {
            for(int j = 0; j < matrixToAdd.getNumCols(); j++)
            {
                temp.addElement(i,j,matrixToAdd.getElement(i,j));
            }
        }

        while(matrix1 != null)//below only adds the non-zero elements from the first matrix as 0 plus a number is that number anyways
        {
            temp.addElement(matrix1.row, matrix1.col, (temp.getElement(matrix1.row,matrix1.col) + matrix1.data));//gets the element from the temp matrix and adds  it with the element from the 1st matrix. Then the  element is added into the matrix
            matrix1 = matrix1.next;
        }
        return temp;
    }

    /*takes another matrix as input and returns the product of the two matrices*/
    public SparseInterface multiplyMatrices(SparseInterface matrixToMultiply)
    {
        if(getNumCols() != matrixToMultiply.getNumRows())// Test to see if this is a valid multiplication
        {
            System.out.println("Error the matrices cols and rows are not the same so they cannot be mutiplied");
            return null;
        }
        SparseInterface temp = new SparseMatrix();
        temp.setSize(getNumRows(),matrixToMultiply.getNumCols());// Takes the rows from the 1st matridx and the cols from the second matrix
        for(int i = 0; i < getNumRows(); i++)// iteration for 1st matrix rows
        {
            for(int j = 0; j < matrixToMultiply.getNumCols(); j++)//iteration for 2nd matrix cols
            {
                int item = 0;
                for(int k = 0; k < matrixToMultiply.getNumRows(); k++)//iteration for cols of 1st matrix and rows of second matrix
                {
                    item +=  getElement(i,k)*matrixToMultiply.getElement(k,j);//calculation for element
                }
                temp.addElement(i,j,item);
            }
        }

        return temp;
    }

}