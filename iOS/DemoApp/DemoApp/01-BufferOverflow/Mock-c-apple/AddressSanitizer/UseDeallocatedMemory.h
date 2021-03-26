//
//  UseDeallocatedMemory.h
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyClass : NSObject{
    @public
    int age;
}
@end



@interface UseDeallocatedMemory : NSObject

+ (void)useOfDeallocatedMemory;
+(void)useOfDeallocatedPointer;

@end

NS_ASSUME_NONNULL_END
