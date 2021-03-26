//
//  RuntimeSanitizationMock.h
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeSanitizationMock : NSObject

+(int)addressSanitizer;
+(int)threadSanitizer;
+(int)undefinedBehaviorSanitizer;

@end

NS_ASSUME_NONNULL_END
