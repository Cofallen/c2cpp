#include <stdio.h>
#include "main.h"

typedef int (*FuncPtr)(void);

// 模拟命名空间
typedef struct Namespace {
    float (*function1)(int);
    void (*function2)(void);
    FuncPtr function3;
}Namespace;

// 定义命名空间内的函数
float function1_impl(int a) {
    a++;
    printf("Function 1 called\n");
    return 1.0f;
}

void function2_impl(void) {
    printf("Function 2 called\n");
}

int exampleFunction(void) {
    printf("Example function called!\n");
    return 1;
}

int main() {
    // 创建命名空间实例
    Namespace ns;
    
    // 将函数指针赋值
    ns.function1 = function1_impl;
    ns.function2 = function2_impl;
    ns.function3 = exampleFunction;

    // 调用命名空间中的函数
    ns.function1(4);
    ns.function2();
    ns.function3();
    // printf("Hello, World!\n");
    
    return 0;
}
