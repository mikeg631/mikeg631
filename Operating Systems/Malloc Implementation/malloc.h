// Allocate `amount` bytes of space, pointed to by the given pointer.
void* xmalloc(size_t amount);
// Free the space pointed to by `ptr`.
void xfree(void* ptr);
