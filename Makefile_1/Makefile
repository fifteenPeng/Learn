# image:a.o b.o c.o funny		#终极目标一定要写在最上面，冒号后面其次依赖文件，依赖文件是个个 小目标
# 	gcc a.o b.o c.o -o image

# a.o:a.c
# 	gcc a.c -o a.o -c
# b.o:b.c
# 	gcc b.c -o b.o -c
# c.o:c.c
# 	gcc c.c -o c.o -c

# funny:
# 	echo "start make project"


# # 方法2
# OBJ = a.o b.o c.o 
# CC = gcc

# image:$(OBJ)
# 	$(CC) $(OBJ) -o image

# a.o:a.c
# 	$(CC) a.c -o a.o -c
# b.o:b.c 
# 	$(CC) b.c -o b.o -c
# c.o:c.c
# 	$(CC) c.c -o c.o -c

# clean:
# 	$(RM) *.o image


# 方法3
OBJ = a.o b.o c.o 
CC = gcc

image:$(OBJ)		# ^依赖列表		@目标完整名
	$(CC) $^ -o $@		

a.o:a.c
	$(CC) $^ -o $@ -c
b.o:b.c 
	$(CC) b.c -o b.o -c
c.o:c.c
	$(CC) c.c -o c.o -c

clean:
	$(RM) *.o image