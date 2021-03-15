//
//  SanitizersOCBridge.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/15.
//

#import "SanitizersOCBridge.h"
#import "google_sanitizers.hpp"

@implementation SanitizersOCBridge

+(void)test3_MemorySanitizer {
    test3_MemorySanitizer(20);
}

@end
