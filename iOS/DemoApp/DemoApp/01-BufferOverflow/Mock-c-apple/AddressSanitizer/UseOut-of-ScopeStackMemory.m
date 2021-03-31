//
//  UseOut-of-ScopeStackMemory.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/26.
//

#import "UseOut-of-ScopeStackMemory.h"

@implementation UseOut_of_ScopeStackMemory




+(void)test {
    int *pointer = NULL;
    if (true) {
        int value = 20;
        pointer = &value;
    }
    *pointer = 42;
}

@end



