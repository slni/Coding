//
//  01-ReadMe.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//

/**
 
 ### 1. 缓冲区溢出 Buffer overflow
 * 什么是缓冲区?
    * 简单地说，缓冲区就是一个正在运行的程序所使用的内存位置。程序运行所使用的内存位置又可以细分为堆区（Heap），栈区(Stack)，全局区(Global Variables)，代码区(Base Code)
    * 我们也可以继续按溢出发生的具体位置具体命名，比如发生在栈区，我们也可以叫*栈溢出（Stack overflow)*，比如知名的程序员问答网站stackoverflow就是以此命名的。
 
 ### 2. AddressSanitizer分析工具
 * Google旗下的开源工具AddressSanitizer可以帮助我们检测此类错误
 
 ### 3. Xcode中内置了AddressSanitizer分析工具

 */
