#!/bin/sh
cronfile="/etc/crontab"             		#debian cronfile
basepath=$(cd `dirname $0`; pwd) 		#shell's dir
crontaskname="bwb_mysqlbacky_everyday.sh"       #shell's name
crontasktime="30 5\t* * *"	 		#cron time
datapath=$basepath'/bakmysql'

echo "checking..."
if [ ! -f ${cronfile} ]; then  
    echo "crontab file $cronfile doesn't exsits.\nplease check file or modify shell setting and run shell again."  
    exit 1
fi

mysqlver=`mysql -V 2>&1|awk '{print $5}'|awk -F '.' '{print $1}'`
if [ $mysqlver != '5' ]; then
    echo "mysql5(.6) is needed."
    exit 1
fi

echo "writing crontab file..."
if [ `grep -c "${crontaskname}" ${cronfile}` -eq '0' ]; then
    echo "${crontasktime}\troot\t${basepath}/${crontaskname}">>${cronfile}
else
    sed -i "s#^.*${crontaskname}.*#${crontasktime}\troot\t${basepath}/${crontaskname}#" ${cronfile}
fi
/etc/init.d/cron restart

echo "making data dir..."
if [ ! -d "${datapath}" ]; then
    mkdir ${datapath}
else
    rm -rf ${datapath}
    mkdir ${datapath}
fi

if [ ! -d "${datapath}old" ]; then
    mkdir ${datapath}old
else
    rm -rf ${datapath}old
    mkdir ${datapath}old
fi

echo "changing permission..."
chmod +x "$basepath/$crontaskname"
chmod +w -R $datapath
chmod +w -R ${datapath}old

echo "finished!"











