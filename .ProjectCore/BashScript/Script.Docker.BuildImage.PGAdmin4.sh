#----------------------------------------------------------------------------------------------------
# ▪ Nama               : Script.Docker.BuildImage.PGAdmin4.sh
# ▪ Versi              : 1.00.0001
# ▪ Tanggal            : 2021-08-09
# ▪ Input              : -
# ▪ Output             : -
# ▪ Deskripsi          : Script ini digunakan untuk menarik Image PGAdmin4 didalam Docker
# ▪ Execution Syntax   : ./BashScript/Script.Docker.BuildImage.PGAdmin4.sh
#                        <FullPathFromRoot>/BashScript/Script.Docker.BuildImage.PGAdmin4.sh
# ▪ Copyright          : Zheta © 2020, 2021
#----------------------------------------------------------------------------------------------------

#!/bin/bash

clear;

sudo docker pull dpage/pgadmin4:5.2;

sudo docker pull dpage/pgadmin4;
sudo docker build --file ./.ProjectCore/Configuration/Docker/PGAdmin4/Dockerfile -t erp-reborn-pgadmin4 .;
