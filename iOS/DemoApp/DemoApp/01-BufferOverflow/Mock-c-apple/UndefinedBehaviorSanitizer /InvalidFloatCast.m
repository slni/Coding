//
//  InvalidFloatCast.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/4/11.
//

#import "InvalidFloatCast.h"

@implementation InvalidFloatCast

+(void)test {
    double n = 10e50;
    float m = (float)n; // Error: 10e50 can't be represented as a float.
}

@end
