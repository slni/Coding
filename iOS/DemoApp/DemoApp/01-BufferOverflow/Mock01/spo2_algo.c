//
//  spo2_algo.c
//  CIndexOut
//
//  Created by 倪申雷 on 2021/2/20.
//

#include "spo2_algo.h"
#include <stdlib.h>
#include <string.h>

int doSpo2Algo(void) {
    int spo2_size = 10;
    Student* spo2_array = (Student*)malloc((spo2_size) * sizeof(Student));
    // 将某一块内存中的内容全部设置为指定的值
    memset(spo2_array, 0, spo2_size * sizeof(Student));
    for (int index = 0; index < spo2_size; index++) {
        spo2_array[index].number = index;
        spo2_array[index].age = 20;
        /// 添加friends,  friends的最大个数为4
        for (int friendIndex = 0; friendIndex < 5; friendIndex ++) {
            spo2_array[index].friends[friendIndex] = friendIndex;
        }
    }
    free(spo2_array);
    return 0;
}
