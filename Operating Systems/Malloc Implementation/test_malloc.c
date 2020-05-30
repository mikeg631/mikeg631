#include<stdio.h>
#include "minunit.h"
#include "malloc.h"

int tests_run = 0;

static char* test_simple_allocation() {
    long* space = xmalloc(sizeof(long));
    mu_assert("space is NULL", space != NULL);
    *space = 80001;
    xfree(space);
    return 0;
}

static char* test_reuse_space() {
    void* space = xmalloc(sizeof(long));
    xfree(space);
    void* space2 = xmalloc(sizeof(char));
    mu_assert("space is not re-used", space == space2);
    xfree(space2);
    return 0;
}

static char* test_insane_alloc() {
    void* space = xmalloc(10000000000000000000ull);
    mu_assert("space allocated for 10EB. please let me know where you got that amount of space", space == NULL);
    xfree(space);
    return 0;
}

static char* test_split_space() {
    // allocate space equal to that used by previous tests
    void* dummy = xmalloc(sizeof(long));

    void* start = xmalloc(10 * sizeof(long));
    void* end = xmalloc(10 * sizeof(long));
    mu_assert("end not past start", end > start);
    xfree(start);

    void* space = xmalloc(sizeof(long));
    void* space2 = xmalloc(sizeof(long));

    mu_assert("space not split & re-used", space < end && space2 < end && space == start && space2 > space);

    xfree(space);
    xfree(space2);
    xfree(dummy);
    xfree(end);

    return 0;
}

static char* test_merge_space() {
    void* a = xmalloc(sizeof(long));
    void* b = xmalloc(sizeof(long));
    xfree(a);
    xfree(b);

    void* merged = xmalloc(2 * sizeof(long));

    mu_assert("space is not merged / re-used", merged == a);

    xfree(merged);

    return 0;
}

static char * all_tests() {
    mu_run_test(test_simple_allocation);
    mu_run_test(test_insane_alloc);
    mu_run_test(test_reuse_space);
    mu_run_test(test_split_space);
    mu_run_test(test_merge_space);
    return 0;
}

int main() {
    char *result = all_tests();
    if (result != 0) {
        printf("%s\n", result);
    }
    else {
        printf("ALL TESTS PASSED\n");
    }
    printf("Tests run: %d\n", tests_run);

    return result != 0;
}
