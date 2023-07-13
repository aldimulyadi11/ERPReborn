#!/bin/bash

varTitle='( Samba )';

if [ ! -f /zhtConf/tmp/processSign/.initialized ]; then
   touch /zhtConf/tmp/processSign/.initialized;
   #sleep 30;
   
   echo -e "\e[1;33m"$varTitle" ► Samba Service Initialization...\e[0m";
   samba-tool domain passwordsettings set --complexity=off;
   samba-tool domain passwordsettings set --max-pwd-age=0;
   samba-tool domain passwordsettings set --history-length=0;
   samba-tool domain passwordsettings set --min-pwd-age=0;
   samba-tool domain passwordsettings set --min-pwd-length=4;

   echo -e "\e[1;33m"$varTitle" ► Samba Users Recreation...\e[0m";
   samba-tool user delete sysadmin;
   samba-tool user add sysadmin sysadmin1234;

   samba-tool user delete teguh.pratama;
   samba-tool user add teguh.pratama teguhpratama1234;

   samba-tool user delete icha;
   samba-tool user add icha icha1234;

   samba-tool user delete suyanto;
   samba-tool user add suyanto suyanto1234;

   samba-tool user delete aldi.mulyadi;
   samba-tool user add aldi.mulyadi aldi1234;
   
   samba-tool user delete budianto;
   samba-tool user add budianto budianto1234;
 
   samba-tool user delete kurnia;
   samba-tool user add kurnia kurnia1234;

   samba-tool user delete eka.bagus;
   samba-tool user add eka.bagus eka.bagus1234;

   samba-tool user delete eka.purwanti;
   samba-tool user add eka.purwanti eka.purwanti1234;

   samba-tool user delete febriyanto;
   samba-tool user add febriyanto febriyanto1234;

   samba-tool user delete ferdian;
   samba-tool user add ferdian ferdian1234;

   samba-tool user delete redi.subekti;
   samba-tool user add redi.subekti redi1234;
 
   samba-tool user delete restu;
   samba-tool user add restu restu1234;

   samba-tool user delete seftiyan;
   samba-tool user add seftiyan seftiyan1234;

   samba-tool user delete sufie;
   samba-tool user add sufie sufie1234;

   samba-tool user delete wardah;
   samba-tool user add wardah wardah1234;

   samba-tool user delete zainudin.anwar;
   samba-tool user add zainudin.anwar anwar1234;

fi
