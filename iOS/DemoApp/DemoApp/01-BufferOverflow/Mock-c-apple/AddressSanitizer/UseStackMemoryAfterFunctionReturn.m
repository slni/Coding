//
//  UseStackMemoryAfterFunctionReturn.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/26.
//

#import "UseStackMemoryAfterFunctionReturn.h"

int *integer_pointer_returning_function(void);

@implementation UseStackMemoryAfterFunctionReturn

+(void)test {
    int *integer_pointer = integer_pointer_returning_function();
    *integer_pointer = 43;
    NSLog(@"%d", *integer_pointer);
}

@end





























int *integer_pointer_returning_function() {
    int value = 42;
    return &value;
}
