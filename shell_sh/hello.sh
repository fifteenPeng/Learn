#!/bin/bash

myname="my hello!"
echo "hello!"

echo $myname

echo number
echo $#
echo $1
echo "two"
echo $2

echo "all"
echo $*

echo `date`
echo "$myname add"
echo '$muname add'

ls 1>>a.txt     #!追加

echo muname add > b.txt  #！重定向
echo 0< b.txt
#echo '$muname add' > b.doc  #！重定向
echo 0< b.doc           #!为什么没法输出

echo "test"
echo `test -r a.txt`
if test -r a.txt
then
    echo "test access read"
elif test -e b.txt
then
    echo "not read"
fi

read VAR        #!从键盘中读取
case $VAR in
    1) echo "one"
    ;;
    *) echo "other"
    ;;
esac

declare -i n=0
while [ $n -le 10 ] #小于10则循环
do
    echo "$n"
    n=$n+1
done

until [ $n -gt 15 ]     #满足条件则退出，，gt表示大于
do
    echo "$n"
    n=$n+1
done

files=`ls`      #命令使用反引号
for a in $files
do
    if [ -f $a ]
    then 
        wc -l $a
    fi
done

funtion()
{
    if [ $1 = "q" ]
    then 
        exit
    fi

    USER=`who | grep $1 | wc -l` #等号不能空格
    if [ $USER -eq 0 ]  #左右必须有空格
    then
        return 0
    else
        return 1
    fi
}

echo "PID:$$"

funtion_exit()
{
    echo "exit"
}
trap "" INT     #发现并不能屏蔽这个信号呢
trap funtion_exit HUP
trap funtion_exit EXIT   #推出时将执行该函数

while true
do
    n=$n+1
    echo -n "input a user name:"
    read USER

    funtion $USER 

    if [ $? -eq 1 ]
    then
        echo "[$USERNAME] online"
    else
        echo "offline"
    fi
done
