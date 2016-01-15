#!/bin/bash
ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
PATH=$ORACLE_HOME/bin:$PATH
ORACLE_SID=XE

port=1521; /usr/sbin/startup.sh

sqlplus -s sys/oracle@localhost as sysdba<<-EOF
   create user dmpuser identified by vagrant;
   grant create any directory to dmpuser;
   grant EXP_FULL_DATABASE to dmpuser;
   grant IMP_FULL_DATABASE to dmpuser;
   ALTER USER dmpuser QUOTA unlimited ON system;
EOF

 
