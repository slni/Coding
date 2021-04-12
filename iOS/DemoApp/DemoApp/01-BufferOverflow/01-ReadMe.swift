//
//  01-ReadMe.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//


/**
 问题的引入点：接入算法库，内存溢出问题
 
 看下具体的问题！！！
 https://huami.feishu.cn/docs/doccnTX1hFbVMUvgi6Nj2ruGqbd
 
 AddressSanitizer分析工具
 * Google旗下的开源工具AddressSanitizer可以帮助我们检测此类错误 --> https://github.com/google/sanitizers
 */

 


/**
 - Runtime Sanitization: 运行时检测
    - Address Sanitizer:  地址问题检测 (不能检测内存泄漏问题)
    - Thread Sanitizer:   线程问题检测
    - Undefined Behavior Sanitizer:  未定义行为检测
 */


/**
 # 1. Address Sanitizer
 
   ## 我们常见的内存相关问题：
    * 内存泄漏: (工具: profile -> Leaks)
        - 该释放的内存没有被释放; 造成APP的占用的内存越来越大
    * 非法内存访问: (工具: Scheme -> AddressSanitizer)
        - 修改了不属于自己的内存区域, 非法内存的访问;  造成奔溃
    * 僵尸对象: (工具: profile -> Zombies)
        - “僵尸”对象是指在被释放了之后再被访问的对象，事实上已经不存在了;  造成奔溃
            - 僵尸对象：内存已经被回收的对象。
            - 野指针：指向僵尸对象的指针，向野指针发送消息会导致崩溃。野指针错误形式在Xcode中通常表现为：Thread 1：EXC_BAD_ACCESS，因为你访问了一块已经不属于你的内存。
 
 
    ## AddressSanitizer检测的问题：
    * 1. 使用已释放的内存（如僵尸对象）
    * 2. 释放已释放的内存
    * 3. 释放了不需要释放的内存（释放栈上的内存）
    * 4. 使用了函数返回后的栈内存
    * 5. 使用了超出范围的栈内存
    * 6. 缓冲区溢出问题（上溢出，下溢出）
    * 7. C++中的溢出问题（额外开启：set the Enable C++ Container Overflow Checks for Address Sanitizer build setting to YES.）
        
    注意：Address Sanitizer是不能检测内存泄漏问题的。
 */


/**
 补充：
 ### 缓冲区溢出 Buffer overflow
 * 什么是缓冲区?
    * 简单地说，缓冲区就是一个正在运行的程序所使用的内存位置。程序运行所使用的内存位置又可以细分为堆区（Heap），栈区(Stack)，全局区(Global Variables)，代码区(Base Code)
        * Heap buffer overflow
        * Stack buffer overflow
        * Global buffer overflow
    * 我们也可以继续按溢出发生的具体位置具体命名，比如发生在栈区，我们也可以叫*栈溢出（Stack overflow)*，比如知名的程序员问答网站stackoverflow就是以此命名的。
 
 ### 2.1 偶发性奔溃 -> 分为2类
    * 1. (假偶发性)需要特定的条件触发, 达到特定的条件一定会触发 (如特定的异常数据), 可能触发条件比较苛刻, 但达到该条件一定会触发
    * 2. (真偶发性)完全一样条件, 也不一定会触发奔溃(如内存溢出问题)
 */


/**
 # 2. Thread Sanitizer
 ### 多线程编程中, 常见的问题有:
  * 1 死锁Deadlock
  死锁指的是由于两个或多个执行单元之间相互等待对方结束而引起阻塞的情况。每个线程都拥有其他线程所需要的资源，同时又等待其他线程已经拥有的资源，并且每个线程在获取所有需要资源之前都不会释放自己已经拥有的资源。

  * 2 优先级翻转/倒置/逆转 Priority inversion
  当一个高优先级任务通过信号量机制访问共享资源时，该信号量已被一低优先级任务占有，而这个低优先级任务在访问共享资源时可能又被其它一些中等优先级任务抢先，因此造成高优先级任务被许多具有较低优先级任务阻塞，实时性难以得到保证。

  * 3 数据竞争Race condition
  Data Race是指多个线程在没有正确加锁的情况下，同时访问同一块数据，并且至少有一个线程是写操作，对数据的读取和修改产生了竞争，从而导致各种不可预计的问题。
 
注意：
* 不支持watchos的程序, 真机上运行的iOS和tvOS程序；
* 支持64-bit macOS 程序，或者64-bit 的iOS，tvOS程序在模拟器中

 */


/**
 # 3. Undefined Behavior Sanitizer:
  什么是未定义行为？
  * "判断输入有没有问题”的代价比问题本身还要高"  （https://zhuanlan.zhihu.com/p/46352946）
 
 */


/*
 * Xcode中内置了AddressSanitizer分析工具，Apple文档: https://developer.apple.com/documentation/xcode/diagnosing_memory_thread_and_crash_issues_early
 * 原理：https://zhuanlan.zhihu.com/p/37515148
 */
