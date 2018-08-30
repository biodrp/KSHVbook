# ROSE的脚本

## 简介

需要的fastq文件先做好，建好文件夹，算是二次矫正下

---

## 命令参数

- -o：输出文件名字
- -i：input文件，yes为双末端，no为单末端
- -a：双末端input第一个文件，单末端就是一个文件
- -b：双末端input第二个文件
- -c：case文件，yes为双末端，no为单末端
- -y：双末端cas第一个文件，单末端就是一个文件
- -z：双末端cas第二个文件

在命令的末尾要加上这句|tee log.txt，输出日志文件和统计信息

---

## eg

bash rose.sh -o iPS-DF-test  -i yes -a ENCSR086NVH -b ENCSR086NVH -c no -y ENCSR505OPZ |tee log.txt