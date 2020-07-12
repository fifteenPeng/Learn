image:a.o b.o c.o funny		#终极目标一定要写在最上面，冒号后面其次依赖文件，依赖文件是个个 小目标
	gcc a.o b.o c.o -o image

a.o:a.c
	gcc a.c -o a.o -c
b.o:b.c
	gcc b.c -o b.o -c
c.o:c.c
	gcc c.c -o c.o -c

funny:
	echo "start make project"
