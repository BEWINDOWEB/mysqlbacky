# mysqlbacky
![通过测试](https://img.shields.io/badge/build-passing-green.svg)
![系统需要debian8.2 64位](https://img.shields.io/badge/debian-8.2(64%20bit)-orange.svg)
![mysql5.6](https://img.shields.io/badge/mysql-5.6-blue.svg)

>一个在Debian系统上自动备份mysql数据库的脚本。<br>
>A script to automatically backup MySQL database on Debian system.

## 1. 如何使用？
1) 首先在服务器上安装`Debian 8.2(64位)`操作系统
2) 用FTP上传*mysqlback*或者用wget的方式，把脚本文件传到服务器上：
```sh
wget "https://github.com/BEWINDOWEB/mysqlbacky/archive/master.zip"
```
3)设置参数
```sh
vi bwb_mysqlbacky_everyday.sh
```
编辑需要备份的数据库名、登录mysql的用户名、密码
```
databasename="your database name"
user="root"
password="your password"
```
3) 运行脚本
```sh
chmod +x bwb_mysqlbacky_main.sh
./bwb_mysqlbacky_main.sh
```

## 2. 我怎么知道运行成功了？
1) 如果安装顺利，会在mysqlbacky目录下生成`bakmysql`目录和`bakmysqlold`，`bakmysql`目录会保存最新的一个备份，`bakmysqlold`会保存过去七天的备份。
2) 脚本会在每天凌晨5:30分运行，`bakmysql`目录会.sql文件，如：
```
bakmysql-2018-06-10.sql
```
## 3.其他
欢迎提交issues

		
## 1. HOW TO USE?
1) First, install the *Debian 8.2 (64 bit)* operating system on the server.
2) Upload the *lotterygraber* with FTP OR use
```sh
wget "https://github.com/BEWINDOWEB/mysqlbacky/archive/master.zip"
```
3) setting parameters
```sh
vi bwb_mysqlbacky_everyday.sh
```
Edit the database name that needs to be backed up, login MySQL's username and password.
```
databasename="your database name"
user="root"
password="your password"
```
4) run the shell
```sh
chmod +x bwb_mysqlbacky_main.sh
./bwb_mysqlbacky_main.sh
```

## 2. HOW CAN I KOWN THAT I HAVE INSTALLED LNMP SUCCESSFULLY?
1) If the installation goes well, the `bakmysql` directory and `bakmysqlold` will be generated under the mysqlbacky directory, and the `bakmysql` directory will save the latest backup, and `bakmysqlold` will save the last seven days' backup.
2) The script will run at 5:30 every morning, and the `bakmysql` directory will generate .sql files, such as:
```
bakmysql-2018-06-10.sql
```
## 3.at last
welcome to propose issues, and forgive me for poor English.
