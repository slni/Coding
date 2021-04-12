//
//  IntegerOverflow.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/4/11.
//

#import "IntegerOverflow.h"

@implementation IntegerOverflow

+(void)test {
    int32_t x = (1U << 31) - 1;
    x += 1;
    printf(@"%d", x);
}

@end
