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
# OBJ = a.o b.o c.o 
# CC = gcc

# image:$(OBJ)		# ^依赖列表		@目标完整名
# 	$(CC) $^ -o $@		

# a.o:a.c
# 	$(CC) $^ -o $@ -c
# b.o:b.c 
# 	$(CC) b.c -o b.o -c
# c.o:c.c
# 	$(CC) c.c -o c.o -c

# clean:
# 	$(RM) *.o image

vpath %.c = source/:source2/
vpath %.h = inc/
VPATH = inc/

BINARY = binary/
OBJ = a.o b.o c.o 
CC = gcc
LIB = ./lib/

image:$(addprefix $(BINARY),$(OBJ))	#$(OBJ)		# ^依赖列表		@目标完整名 #通过函数进行拼接
	$(CC) $(addprefix $(BINARY),$(OBJ)) -o $@	-L./lib/ -lmylib -L/home/pengfei/Learn/Makefile_1/makedir/lib/ -lmysolib 

$(BINARY)a.o:a.c
	$(CC) $^ -o $@ -c
$(BINARY)b.o:b.c 
	$(CC) $^ -o $@ -c
$(BINARY)c.o:c.c c.h				#只有链接的时候才需要库文件
	$(CC) $< -o $@ -c -I$(VPATH) 

libcreat:
	gcc ./lib/d.c -o ./lib/d.o -c
	ar rcs ./lib/libmylib.a ./lib/d.o 

	gcc ./lib/e.c -o ./lib/e.o -c -fPIC
	gcc -shared -o ./lib/libmysolib.so ./lib/e.o

clean:
	$(RM) $(BINARY)*.o image

#gcc main.c -o mian -I./include -L./lib -lmylib -static		#指定静态库

#生成静态库
#gcc d.c -o d.o -c
#ar rcs libmylib.a d.o

#动态库的名字
#libmylib.so
#gcc -fPIC -shared e.c k.c -o ./lib/libmysolib.so
#链接后，也生成后，运行时发现 ldd 命令查看还是无法看到链接库
#         linux-vdso.so.1 =>  (0x00007ffe18384000)
#         libmysolib.so => not found
#         libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f01af92b000)
#         /lib64/ld-linux-x86-64.so.2 (0x0000564428f01000)

# 所以把libmysolib.so 直接放到了 /lib 目录下，编译成功
#或者这么追加，也可以找到
#export LD_LIBRARY_PATH=`pwd`/lib:$LD_LIBRARY_PATH 
# $ ldd image         linux-vdso.so.1 =>  (0x00007ffeae5d6000)
#         libmysolib.so => /home/pengfei/Learn/Makefile_1/makedir/lib/libmysolib.so (0x00007f701efcb000)
#         libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f701ebe8000)
#         /lib64/ld-linux-x86-64.so.2 (0x00005642eb3e1000)