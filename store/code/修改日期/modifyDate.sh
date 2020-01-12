now=`date +"%Y-%m-%d %H:%M:%S"`
echo $now

# 正则表达式
re="[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} [0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}"

# 修改目标1
objTest="\(^INSERT INTO SQOOP_SESSIONS VALUES('job_test','incremental.last.value','\)"$re"\(','SqoopOptions')\)"

# 修改目标2
objTest2="\(^\#define version \"0.0.1 \)"$re"\(\"\)"

sed -i -e "s/$objTest2/\1$now\2/" test.txt

sed -i -e "s/$objTest/\1$now\2/"  test.txt
