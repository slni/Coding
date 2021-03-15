//
//  google.cpp
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//

#include "google_sanitizers.hpp"

/**
 * MemorySanitizer (MSan) is a detector of uninitialized memory reads in C/C++ programs.
 */
int test3_MemorySanitizer(int argc) {
    int *a = new int[10];
    a[5] = 0;
    if (a[argc])
        printf("xx\n");
    return 0;
}
