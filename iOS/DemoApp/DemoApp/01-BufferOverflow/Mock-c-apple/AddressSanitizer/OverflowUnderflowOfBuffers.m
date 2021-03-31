//
//  OverflowUnderflowOfBuffers.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/30.
//

#import "OverflowUnderflowOfBuffers.h"

int global_array[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
void foo11111() {
    int idx = 10;
    global_array[idx] = 42; // Error: out of bounds access of global variable
    char *heap_buffer = malloc(10);
    heap_buffer[idx] = 'x'; // Error: out of bounds access of heap allocated variable
    /// ??? 会立马奔溃
//    char stack_buffer[10];
//    stack_buffer[idx] = 'x'; // Error: out of bounds access of stack allocated variable
}

@implementation OverflowUnderflowOfBuffers

+(void)test {
    foo11111();
}

@end



