#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <stdbool.h>
#include <unistd.h>

typedef struct block_metadata
{
    struct block_metadata *next;//Struct is singlely linked with a placeholder node as header
    size_t size;//holds the space of this block, does not include the size the metadata holds
    bool isFree;//if true, then this space can be re-used 

} block_metadata;
block_metadata b = {.next = NULL, .size = 0, .isFree = false}; //global variable for file this is just a header and can't be used

void *xmalloc(size_t amount)
{

    block_metadata *temp = &b; //hold address of current metadata blcok
    while (temp->next != NULL)
    {
        temp = temp->next;
        if (temp->isFree && temp->size >= amount) // checking if enough space is available
        {
            temp->isFree = false;                  //setting block as in use
            if (temp->size > (amount + sizeof(b))) // checking if we should split block so long as there is 1+sizeof(b) amount left
            {
                void *newPtr = (void *)temp + amount + sizeof(b); //set newptr to the start of the new block
                block_metadata newBlock = {.next = temp->next, .size = temp->size - sizeof(b) - amount, .isFree = true};
                *((block_metadata *)newPtr) = newBlock; //place new metadata block at begining of ptr
                temp->size = amount;                    //current block holds just enough space. New block holds any extra space
                temp->next = newPtr;                    //next block is now the split block
            }
            return (void *)temp + sizeof(b); //return the location after the block metadata
        }
    } //temp->next == NULL is true so we couldn't find a viable block and must make it
    void *pointer = sbrk(amount + sizeof(b));
    if (pointer == (void *)-1) //sbrk returns (void*)-1 if request fails. In this case we return NULL
    {
        return NULL; // Some sort of error happened in sbrk
    }
    block_metadata tempBlock = {.next = NULL, .size = amount, .isFree = false};
    *((block_metadata *)pointer) = tempBlock; //placing metadata at start of block
    temp->next = pointer;
    return pointer + sizeof(b);
}

void xfree(void *ptr)
{
    block_metadata *temp = &b;
    while (temp->next != NULL)
    {
        block_metadata *prev = temp; //place holder for previous block
        temp = temp->next;
        if ((void *)(temp + 1) == ptr) //checking if ptr matches to a corresponding block
        {
            temp->isFree = true; //set to free
            if (temp->next != NULL && temp->next->isFree)
            {
                temp->size = temp->size + temp->next->size + sizeof(b);
                temp->next = temp->next->next; //merging blocks by skipping next block, and replacing it with it's next
            }
            if (prev != NULL && prev->isFree)
            {
                prev->size = prev->size + temp->size + sizeof(b); //merging sizes
                prev->next = temp->next;                          //skipping this block in the list and appending next.
            }
            return;
        }
    }
    /* if we get here this pointer was not previously returned by xmalloc . According to the linux man page this is undefined behavior for free 
    so this program will just stop here*/
    return;
}