# ehep-2023
Installation notes for ROOT and Geant4

## Download links

| Software | Download Link (tested for Ubuntu)                                                                                                                                      | Size (approx) | Install command                                                                                |
|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------|------------------------------------------------------------------------------------------------|
| Anaconda | https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-x86_64.sh  Refer https://www.anaconda.com/download for other OS                                            | 1 GB          | ```chmod +x Anaconda3-2023.07-2-Linux-x86_64.sh``` ```./Anaconda3-2023.07-2-Linux-x86_64.sh``` |
| Snap     | Direct install  Refer https://snapcraft.io/docs/installing-snap-on-ubuntu for other OS                                                                                 | 5 MB          | ```sudo apt update``` ```sudo apt install snapd```                                             |
| VSCode   | Direct install Refer https://code.visualstudio.com/ for more information                                                                                               | 70 MB         | ```sudo snap install code --classic```                                                         |
| Git      | Direct install                                                                                                                                                         | 20 MB         | ```sudo snap install git-ubuntu --classic```                                                   |
| CMake    | Direct Install                                                                                                                                                         | 5 MB          | ```sudo snap install cmake --classic```                                                        |
| ROOT     | https://root.cern/download/root_v6.28.06.source.tar.gz                                                                                                                 | 200 MB        | To be discussed, refer to https://root.cern/install/ for requirements for your system          |
| Geant4   | https://gitlab.cern.ch/geant4/geant4/-/archive/v11.1.2/geant4-v11.1.2.tar.gz | 450 MB        | To be discussed …                                                                              |                                                                      |

## Geant4 datasets

For Geant4 simulations to run, you need to download the datasets on to your computer:

Go to: https://geant4.web.cern.ch/download/11.1.2.html

Download all the datasets therein into the ‘data’ folder inside g4

## Dependencies
To install the dependencies, use the following commands
- ROOT
  - ```sudo apt-get install dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev python libssl-dev```
  - ```sudo apt-get install gfortran libpcre3-dev xlibmesa-glu-dev libglew-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev python-numpy libxml2-dev libkrb5-dev libgsl0-dev qtwebengine5-dev```
- Geant4
  - GDML: ```sudo apt-get install -y libxerces-c-dev```
  - libXMu: ```sudo apt-get install -y libxmu-dev```
  - Qt:
       - ```sudo apt-get install qtbase5-dev```
       - ```sudo apt-get install qtdeclarative5-dev```
  - OpenSSL: ```sudo apt-get -y install build-essential openssl libssl-dev libssl1.0 libgl1-mesa-dev libqt5x11extras5``` 
   

## Folder structure

For the sake of this preschool, we propose to use this folder structure:
- Create a main directory called `ehep`, preferably on the Desktop
- Inside of ehep, create three directories (along with the subdirectories as shown below
  - `downloads`
  - `g4`
    - `build`
    - `install`
    - `data`   
  - `root`
    - `build`
    - `install`

## Easy install script

I have written a script which will do all of the above in one go, the script named ```ehep.sh``` is found in this repository, you can download it on your Desktop:
https://github.com/deepaksamuel/ehep-2023/blob/main/ehep.sh
<a id="raw-url" href="[https://raw.githubusercontent.com/deepaksamuel/ehep-2023/main/ehep.sh?token=GHSAT0AAAAAACIYOSDP5Y22GDYMMLI7HAOUZJ47Y3A](https://github.com/deepaksamuel/ehep-2023/blob/main/ehep.sh)">Right click and save link as ehep.sh on your Desktop</a>

Once saved, on your terminal execute the command ```source ehep.sh```
