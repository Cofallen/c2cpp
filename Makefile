# 编译器
CC = gcc

# 编译选项
CFLAGS = -Iinc -Wall -Wextra

# 源文件和目标文件
SRC_DIR = src
INC_DIR = inc
BUILD_DIR = build
BIN_DIR = bin

# 查找所有的 .c 文件
SRCS = $(wildcard $(SRC_DIR)/*.c)

# 生成对应的 .o 文件
OBJS = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))

# 最终的可执行文件
TARGET = $(BIN_DIR)/main

# 默认目标
all: $(TARGET)

# 链接目标
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)  # 确保 bin 目录存在
	$(CC) -o $@ $^

# 编译 .c 文件为 .o 文件
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
# $(OBJS): $(SRCS)
	@mkdir -p $(BUILD_DIR)  # 确保 build 目录存在
	$(CC) $(CFLAGS) -c $< -o $@

# 清理生成的文件
clean:
	rm -rf $(BUILD_DIR)/*.o $(TARGET)

.PHONY: all clean
