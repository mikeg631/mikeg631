#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>

typedef struct block_metadata
{
    struct block_metadata *next;
    size_t size;
    bool isFree;

} block_metadata;
block_metadata b = { .next = NULL, .size = 0, .isFree = false};

int main()
{
    block_metadata *t;
    t = &b;
    void* f = (&b)+1;
    f++;
    long n = (&b);
    long d = f;
    printf("size of b: %ld\n",sizeof(b));
       printf("size of size: %ld\n",sizeof(b->size));
    printf("address of b: %ld\n",n);
    printf("address of b: %ld\n",d);
    printf("d-n: %ld\n",d-n);



    return 0;
}