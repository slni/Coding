//
//  google_sanitizers.c
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//

#include "google_sanitizers.h"
#include <stdlib.h>

/**
 * AddressSanitizer (aka ASan) is a memory error detector for C/C++. It finds:
    * Use after free (dangling pointer dereference)
    * Heap buffer overflow
    * Stack buffer overflow
    * Global buffer overflow
    * Use after return
    * Use after scope
    * Initialization order bugs
    * Memory leaks
*/
int test1_AddressSanitizer(void) {
    char *x = (char*)malloc(10 * sizeof(char*));
    free(x);
    return x[5];
}

/**
 * LeakSanitizer is a memory leak detector which is integrated into AddressSanitizer. The tool is supported on x86_64 Linux and OS X.
 */
void *p;
int test2_LeakSanitizer(void) {
  p = malloc(7);
  p = 0; // The memory is leaked here.
  return 0;
}
