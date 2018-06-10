#!/bin/sh
basepath=$(cd `dirname $0`; pwd)         #shell's dir
datapath=$basepath'/bakmysql'            #shell's datadir
mdpath=$(which mysqldump) 	         #mysqldump path
databasename="your database name"
user="root"
password="your password"

if [ "`ls -A ${datapath}`" != "" ]; then
    mv ${datapath}/*.sql  ${datapath}old/ 2>/dev/null
fi
Now=$(date +"%Y-%m-%d") 
File=${datapath}/bakmysql-$Now.sql 
${mdpath} -u${user} -p${password} ${databasename} > $File 
SevenDays=$(date -d -7day  +"%Y-%m-%d") 
if [ -f ${datapath}'old/bakmysql-$SevenDays.sql' ]; then
    rm -rf ${datapath}'old/bakmysql-$SevenDays.sql' 
fi
















