
/**
 * Write a description of class MinHeap here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class MinHeap
{
    // instance variables - replace the example below with your own
    private int size, maxSize;
    private HuffTree[] heap;

    /**
     * Constructor for objects of class MinHeap
     */
    public MinHeap(int maxSize)
    {
        this.maxSize = maxSize;
        this.size = 0;
        heap = new HuffTree[maxSize+1];
    }

    private int parent(int pos)
    {
        return pos/2;
    }

    private int leftChild(int pos)
    {
        return (pos*2)+1;
    }

    private int rightChild(int pos)
    {
        return (pos*2)+2;
    }

    private boolean isLeaf(int pos)
    {
        if(pos >= (size/2) && pos <= size)
        {
            return true;
        }
        return false;
    }

    private void swap(int fpos, int spos)
    {
        HuffTree temp;
        temp = heap[fpos];
        heap[fpos] = heap[spos];
        heap[spos] = temp;
    }

    private void minHeapify(int pos)
    {
        HuffTree tmp = heap[pos];
        int child;

        for(; 2*pos <= size; pos = child)
        {
            child = 2*pos;

            if((child-1) >= size &&
            heap[child].compareTo(heap[child + 1]) > 0) child++;

            if(tmp.compareTo(heap[child]) > 0)  
                heap[pos] = heap[child];
            else
                break;
        }
        heap[pos] = tmp;

    } 

    public void insert(HuffTree element)
    {
        int pos = ++size;
        for(; pos > 1 && element.compareTo(heap[pos/2]) < 0; pos = pos/2 )
            heap[pos] = heap[pos/2];

        heap[pos] = element; 
    }

    public void minHeap()
    {
        for (int pos = (size / 2); pos >= 0 ; pos--)
        {
            minHeapify(pos);
        }
    }

    public int size()
    {
        return size;
    }

    public HuffTree remove()
    {
        HuffTree popped = heap[0];
        if(size == 0)
            return null;
        heap[1] = heap[size-1];
        size--;
        minHeapify(0);
        return popped;
    }

}
