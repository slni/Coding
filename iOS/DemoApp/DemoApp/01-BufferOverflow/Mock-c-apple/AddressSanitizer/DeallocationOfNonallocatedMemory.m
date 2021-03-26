//
//  DeallocationOfNonallocatedMemory.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/26.
//

#import "DeallocationOfNonallocatedMemory.h"

@implementation DeallocationOfNonallocatedMemory

+(void)test {
    int value = 42;
    free(&value);
    /*
     Ensure that the free function isn't called on variables allocated on the stack.
     */
}

@end
