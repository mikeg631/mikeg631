
/**
 * Write a description of class Sort here.
 *
 * @author Michael Gordon
 *  Please call selectionSort
 */
public class Sort
{

  
    public static void selectionSort(int[] array)
    {
        int length = array.length;
        for(int i = 0; i < length - 1; i++)
        {
            int min = i;
            for(int j = i+1; j < length; j++)//find min in unsorted array
            {
                if(array[j] < array[min]) //checks to see if item is less than curr min
                 {
                     min = j;
                    }
            }
            
            // below makes the minimum swap with the last element in the unsorted part
            int temp = array[min];
            array[min] = array[i];
            array[i] = temp;
        }
    } 
    
    
    public static void merge(int array[], int low, int middle, int high)
    {
        //sizes of temp arrays
        int n1 = middle - low + 1;
        int n2 = high - middle;
 
        //create temporary left and right
        int left[] = new int [n1];
        int right[] = new int [n2];
 
        
        for (int i=0; i < n1; i++)
        {
            left[i] = array[low + i];
        }
        for (int j=0; j < n2; j++)
        {
            right[j] = array[middle + 1 + j];
        }
 
 
        
 
        //merge
        int i = 0, j = 0, k = low;
        while (i < n1 && j < n2)
        {
            if (left[i] <= right[j])
            {
                array[k] = left[i];
                i++;
            }
            else
            {
                array[k] = right[j];
                j++;
            }
            k++;
        }
 
        // copy remaining elements to left
        while (i < n1)
        {
            array[k] = left[i];
            i++;
            k++;
        }
        // copy remaing elements to right
        while (j < n2)
        {
            array[k] = right[j];
            j++;
            k++;
        }
    }
 
    public static void mergesort(int array[])//overloaded for base
    {
        mergesort(array, 0, array.length-1);
    }
    
    public static void mergesort(int array[], int low, int high)
    {
        if (low < high)
        {
            //finds middle
            int middle = (low+high)/2;
 
            // Sort first and second halves
            mergesort(array, low, middle);
            mergesort(array, middle+1, high);
 
            // merges the two arrays
            merge(array, low, middle, high);
        }
    }
}
