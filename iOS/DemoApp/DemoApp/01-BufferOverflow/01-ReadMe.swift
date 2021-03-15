//
//  01-ReadMe.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//

/**
 
 ### 1. 内存问题概述:
 * 内存泄漏: (工具: profile -> Leaks)
    - 该释放的内存没有被释放; 造成APP的占用的内存越来越大
 * 缓冲区溢出: (工具: Scheme -> AddressSanitizer)
    - 修改了不属于自己的内存区域, 非法内存的访问;  造成奔溃
 * 僵尸对象: (工具: profile -> Zombies)
    - “僵尸”对象是指在被释放了之后再被访问的对象，事实上已经不存在了;  造成奔溃
 
 ### 2. 缓冲区溢出 Buffer overflow
 * 什么是缓冲区?
    * 简单地说，缓冲区就是一个正在运行的程序所使用的内存位置。程序运行所使用的内存位置又可以细分为堆区（Heap），栈区(Stack)，全局区(Global Variables)，代码区(Base Code)
    * 我们也可以继续按溢出发生的具体位置具体命名，比如发生在栈区，我们也可以叫*栈溢出（Stack overflow)*，比如知名的程序员问答网站stackoverflow就是以此命名的。
 
 ### 2.1 偶发性奔溃 -> 分为2类
    * 1. (假偶发性)需要特定的条件触发, 达到特定的条件一定会触发 (如特定的异常数据), 可能触发条件比较苛刻, 但达到该条件一定会触发
    * 2. (真偶发性)完全一样条件, 也不一定会触发奔溃(如内存溢出问题)
 
 ### 3. AddressSanitizer分析工具
 * Google旗下的开源工具AddressSanitizer可以帮助我们检测此类错误 --> https://github.com/google/sanitizers
 
 ### 4. Xcode中内置了AddressSanitizer分析工具

 */
