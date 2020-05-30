/****************************************************************************
 *       This demonstrates binary heap operations along with the heapSort.
 *
 *****************************************************************************/
import java.util.*;


public class Heap
{
   private static final int CAPACITY = 2;

   private int size;            // Number of elements in heap
   private HuffTree[] heap;     // The heap array

   public Heap()
   {
      size = 0;
      heap = new HuffTree[CAPACITY];
   }
   
   public int size()
   {
       return size;
    }

 /**
  * Construct the binary heap given an array of items.
  */
   public Heap(HuffTree[] array)
   {
      size = array.length;
      heap = new HuffTree[array.length+1];

      System.arraycopy(array, 0, heap, 1, array.length);//we do not use 0 index

      buildHeap();
   }
 /**
  *   runs at O(size)
  */
   private void buildHeap()
   {
      for (int k = size/2; k > 0; k--)
      {
         percolatingDown(k);
      }
   }
   private void percolatingDown(int k)
   {
      HuffTree tmp = heap[k];
      int child;

      for(; 2*k <= size; k = child)
      {
         child = 2*k;

         if(child != size &&
            heap[child].compareTo(heap[child + 1]) > 0) child++;

         if(tmp.compareTo(heap[child]) > 0)  
            heap[k] = heap[child];
         else
                break;
      }
      heap[k] = tmp;
   }

 /**
  *  Sorts a given array of items.
  */
   public void heapSort(HuffTree[] array)
   {
      size = array.length;
      heap = new HuffTree[size+1];
      System.arraycopy(array, 0, heap, 1, size);
      buildHeap();

      for (int i = size; i > 0; i--)
      {
         HuffTree tmp = heap[i]; //move top item to the end of the heap array
         heap[i] = heap[1];
         heap[1] = tmp;
         size--;
         percolatingDown(1);
      }
      for(int k = 0; k < heap.length-1; k++)
         array[k] = heap[heap.length - 1 - k];
   }

 /**
  * Deletes the top item
  */
   public HuffTree remove() throws RuntimeException
   {
      if (size == 0) 
        throw new RuntimeException();
      HuffTree min = heap[1];
      heap[1] = heap[size--];
      percolatingDown(1);
      return min;
    }

 /**
  * Inserts a new item
  */
   public void insert(HuffTree x)
   {
      if(size == heap.length - 1) 
      doubleSize();

      //Insert a new item to the end of the array
      int pos = ++size;

      //Percolate up
      for(; pos > 1 && x.compareTo(heap[pos/2]) < 0; pos = pos/2 )
         heap[pos] = heap[pos/2];

      heap[pos] = x;
   }
   
   private void doubleSize()
   {
      HuffTree [] old = heap;
      heap = (HuffTree []) new HuffTree[heap.length * 2];
      System.arraycopy(old, 1, heap, 1, size);
   }


 
}