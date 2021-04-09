//
//  ASTest.cpp
//  DemoApp
//
//  Created by 倪申雷 on 2021/4/9.
//

#include "ASTest.hpp"
#include <vector>

int testCPP() {
    std::vector<int> vector;vector.push_back(0);vector.push_back(1);vector.push_back(2);
    auto *pointer = &vector[0];
    return pointer[3]; // Error: out of bounds access for vector
}

/**
 Note
 This check is disabled by default, because it requires that all statically linked libraries using std::vector are built with Address Sanitizer enabled. To enable this check, set the Enable C++ Container Overflow Checks for Address Sanitizer build setting to YES.
 */

