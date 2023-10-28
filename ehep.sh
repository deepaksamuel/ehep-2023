#!/bin/bash

sudo apt update

packages=( "ROOT" "Geant4" "Anaconda" "Git" "CMake" "VSCode")

parentFolder="ehep"
rootFolder="root"
geant4Folder="g4"
downloadsFolder="downloads"

echo 'This script will download essential software for the EHEP 2023 school'

for i in ${packages[@]}; do echo $i; done

echo ${rootFolder}
mkdir -p $parentFolder/{$rootFolder,$rootFolder/build,$rootFolder/install,$geant4Folder,$geant4Folder/build,$geant4Folder/install,$geant4Folder/data,$downloadsFolder}

echo 'installing snapd...'
sudo apt install snapd
echo 'done...'

echo 'installing cmake...'
sudo snap install cmake --classic
echo 'done...'

echo 'installing git...'
sudo snap install git-ubuntu --classic
echo 'done...'

echo 'installing VSCode...'
sudo snap install code --classic
echo 'done...'

cd $parentFolder/$downloadsFolder
echo 'downloading anaconda...'
wget -nc https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-x86_64.sh
echo 'done...'

echo 'downloading root...'
wget -nc https://root.cern/download/root_v6.28.06.source.tar.gz
tar -xvzf root_v6.28.06.source.tar.gz
mv root-6.28.06 ../$rootFolder/
echo 'done...'

echo 'downloading geant4...'
wget -nc https://gitlab.cern.ch/geant4/geant4/-/archive/v11.1.2/geant4-v11.1.2.tar.gz
tar -xvzf geant4-v11.1.2.tar.gz
mv geant4-v11.1.2 ../$geant4Folder/
echo 'done...'

echo 'installing root dependencies...'
yes | sudo apt-get install dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev python libssl-dev
yes | sudo apt-get install gfortran libpcre3-dev xlibmesa-glu-dev libglew-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev python-numpy libxml2-dev libkrb5-dev libgsl0-dev qtwebengine5-dev
echo 'done installing root dependencies...'

echo 'installing geant4 dependencies...'
yes | sudo apt-get install -y libxerces-c-dev
yes | sudo apt-get -y install build-essential openssl libssl-dev libssl1.0 libgl1-mesa-dev libqt5x11extras5
yes | sudo apt-get install qtbase5-dev
yes | sudo apt-get install qtdeclarative5-dev
yes | sudo apt-get install -y libxmu-dev
echo 'done installing geant4 dependencies...'


echo 'downloading geant4 datasets...'
wget -nc https://cern.ch/geant4-data/datasets/G4NDL.4.7.tar.gz
tar -xvzf G4NDL.4.7.tar.gz
mv G4NDL4.7 ../$geant4Folder/data
echo 'downloaded 1/12 geant4 datasets...'

wget -nc https://cern.ch/geant4-data/datasets/G4EMLOW.8.2.tar.gz
tar -xvzf G4EMLOW.8.2.tar.gz
mv G4EMLOW8.2 ../$geant4Folder/data
echo 'downloaded 2/12 geant4 datasets...'

wget -nc https://cern.ch/geant4-data/datasets/G4PhotonEvaporation.5.7.tar.gz
tar -xvzf G4PhotonEvaporation.5.7.tar.gz
mv PhotonEvaporation5.7 ../$geant4Folder/data
echo 'downloaded 3/12 geant4 datasets...'

wget -nc https://cern.ch/geant4-data/datasets/G4RadioactiveDecay.5.6.tar.gz
tar -xvzf G4RadioactiveDecay.5.6.tar.gz
mv RadioactiveDecay5.6 ../$geant4Folder/data
echo 'downloaded 4/12 geant4 datasets...'

wget -nc https://cern.ch/geant4-data/datasets/G4PARTICLEXS.4.0.tar.gz
tar -xvzf G4PARTICLEXS.4.0.tar.gz
mv G4PARTICLEXS4.0 ../$geant4Folder/data
echo 'downloaded 5/12 geant4 datasets...'

wget -nc https://cern.ch/geant4-data/datasets/G4PII.1.3.tar.gz
tar -xvzf G4PII.1.3.tar.gz
mv G4PII1.3 ../$geant4Folder/data
echo 'downloaded 6/12 geant4 datasets...'


wget -nc https://cern.ch/geant4-data/datasets/G4RealSurface.2.2.tar.gz
tar -xvzf G4RealSurface.2.2.tar.gz
mv RealSurface2.2 ../$geant4Folder/data
echo 'downloaded 7/12 geant4 datasets...'


wget -nc https://cern.ch/geant4-data/datasets/G4SAIDDATA.2.0.tar.gz
tar -xvzf G4SAIDDATA.2.0.tar.gz
mv G4SAIDDATA2.0 ../$geant4Folder/data
echo 'downloaded 8/12 geant4 datasets...'


wget -nc https://cern.ch/geant4-data/datasets/G4ABLA.3.1.tar.gz
tar -xvzf G4ABLA.3.1.tar.gz
mv G4ABLA3.1 ../$geant4Folder/data
echo 'downloaded 9/12 geant4 datasets...'

wget -nc https://cern.ch/geant4-data/datasets/G4INCL.1.0.tar.gz
tar -xvzf G4INCL.1.0.tar.gz
mv G4INCL1.0 ../$geant4Folder/data
echo 'downloaded 10/12 geant4 datasets...'

wget -nc https://cern.ch/geant4-data/datasets/G4ENSDFSTATE.2.3.tar.gz
tar -xvzf G4ENSDFSTATE.2.3.tar.gz
mv G4ENSDFSTATE2.3 ../$geant4Folder/data
echo 'downloaded 11/12 geant4 datasets...'

wget -nc https://cern.ch/geant4-data/datasets/G4TENDL.1.4.tar.gz
tar -xvzf G4TENDL.1.4.tar.gz
mv G4TENDL1.4 ../$geant4Folder/data
echo 'downloaded 12/12 geant4 datasets...'
