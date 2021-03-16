//
//  RuntimeSanitizationMock.m
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/15.
//

#import "RuntimeSanitizationMock.h"

@implementation RuntimeSanitizationMock

/**
 * AddressSanitizer (aka ASan) is a memory error detector for C/C++. It finds:
    * Use after free (dangling pointer dereference)
    * Heap buffer overflow
    * Stack buffer overflow
    * Global buffer overflow
    * Use after return
    * Use after scope
    * Initialization order bugs
    * Memory leaks
*/
+(int)addressSanitizer {
    char *x = (char*)malloc(10 * sizeof(char*));
    free(x);
    NSString *result = [NSString stringWithFormat:@"5 index = %d", x[5]];
    NSLog(@"%@", result);
    return 0;
}

/**
 多线程编程中, 常见的问题有:
 * 死锁Deadlock
 死锁指的是由于两个或多个执行单元之间相互等待对方结束而引起阻塞的情况。每个线程都拥有其他线程所需要的资源，同时又等待其他线程已经拥有的资源，并且每个线程在获取所有需要资源之前都不会释放自己已经拥有的资源。

 * 优先级翻转/倒置/逆转 Priority inversion
 当一个高优先级任务通过信号量机制访问共享资源时，该信号量已被一低优先级任务占有，而这个低优先级任务在访问共享资源时可能又被其它一些中等优先级任务抢先，因此造成高优先级任务被许多具有较低优先级任务阻塞，实时性难以得到保证。

 * 数据竞争Race condition
 Data Race是指多个线程在没有正确加锁的情况下，同时访问同一块数据，并且至少有一个线程是写操作，对数据的读取和修改产生了竞争，从而导致各种不可预计的问题。
 */
+(int)threadSanitizer {
    return 0;
}

// Undefined Behavior Sanitizer
+(int)undefinedBehaviorSanitizer {
    // 8 * 4 = 32bit
    int k = 0x7fffffff;
    k += 1;
    return 0; // runtime error: signed integer overflow: 2147483647 + 1 cannot be represented in type 'int'  //2 147 483 648=2^31
}


@end
