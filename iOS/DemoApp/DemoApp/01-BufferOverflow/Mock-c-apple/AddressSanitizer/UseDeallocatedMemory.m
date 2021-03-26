//
//  UseDeallocatedMemory.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/26.
//

#import "UseDeallocatedMemory.h"

@implementation MyClass

@end



@implementation UseDeallocatedMemory

+ (void)useOfDeallocatedMemory {
    __unsafe_unretained MyClass *unsafePointer;
    @autoreleasepool {
        MyClass *object = [MyClass new];
        object->age = 10;
        unsafePointer = object;
    }
    NSLog(@"%d", unsafePointer->age);
    
    /*
     Use a __strong or __weak reference instead of __unsafe_unretained. Strong ownership ensures that a referenced object is deallocated only when there are no remaining strong references to the object. Weak ownership has no effect on the lifecycle of the object it refers to, but ensures that a variable refers to nil when the object is deallocated.
    */
}

+(void)useOfDeallocatedPointer{
    int *unsafePointer;
    @autoreleasepool {
        MyClass *object = [MyClass new];
        object->age = 20;
        unsafePointer = &object->age;
    }
    NSLog(@"%d", *unsafePointer);
    /*
     Use property accessors rather than direct access to instance variables and pointers whenever possible.
     */
}

@end
