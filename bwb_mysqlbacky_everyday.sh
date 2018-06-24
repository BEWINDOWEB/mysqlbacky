#!/bin/sh
basepath=$(cd `dirname $0`; pwd)         	#shell's dir
datapath=$basepath'/bakmysql'            	#shell's datadir
mdpath="/opt/mysql/server-5.6/bin/mysqldump" 	#mysqldump path
databasename="your database name"
user="root"
password="your password"
hostname="localhost"

if [ "`ls -A ${datapath}`" != "" ]; then
    mv ${datapath}/*.sql  ${datapath}old/ 2>/dev/null
fi
Now=$(date +"%Y-%m-%d") 
File=${datapath}/bakmysql-$Now.sql 
${mdpath} --opt -u${user} -p${password} -h${hostname} ${databasename} --skip-lock-tables > $File
SevenDays=$(date -d -7day  +"%Y-%m-%d") 
if [ -f ${datapath}'old/bakmysql-$SevenDays.sql' ]; then
    rm -rf ${datapath}'old/bakmysql-$SevenDays.sql' 
fi
















