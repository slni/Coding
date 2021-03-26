//
//  DeallocationOfDeallocatedMemory.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/26.
//

#import "DeallocationOfDeallocatedMemory.h"

@implementation DeallocationOfDeallocatedMemory

+(void)testInC {
    int *pointer = malloc(sizeof(int));
    free(pointer);
    free(pointer);
    /*
     Ensure that the free function is called only once for an allocated memory address.
     */
}

@end
