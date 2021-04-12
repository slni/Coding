//
//  DivisionByZero.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/4/11.
//

#import "DivisionByZero.h"

@implementation DivisionByZero

+(void)test {
    int sum = 10;
    for (int i = 0; i < 64; ++i) {
        sum /= i; // Error: division by zero on the first iteration
    }
}

@end
