//
//  OverflowOfCPPContainers.cpp
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/30.
//

#include "OverflowOfCPPContainers.hpp"
#include <vector>

int testCPP() {
    std::vector<int> vector;
    vector.push_back(0);
    vector.push_back(1);
    vector.push_back(2);
    auto *pointer = &vector[0];
    return pointer[3]; // Error: out of bounds access for vector
}

