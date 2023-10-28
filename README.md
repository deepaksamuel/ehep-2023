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

## Easy download script

I have written a script which will do all of the above in one go, the script named ```ehep.sh``` is found in this repository, you can download it on your Desktop:

<a id="raw-url" href="https://raw.githubusercontent.com/deepaksamuel/ehep-2023/main/ehep.sh">Right click and save link as ehep.sh on your Desktop</a>

Once saved, on your terminal execute the command ```source ehep.sh```

Please note that this script will also download the Geant4 datasets which may be extremely time consuming. However, as soon as the datasets downloading begins, parallely you can compile other codes. 

Do not close the terminal in which the ehep.sh script is running. Open a new terminal for parallely compiling the other programmes.

## Instructions for installing ROOT
### Invoking CMake
Most often, softwares used in HEP are distributed as source codes than binaries. In such a case, you will have to use CMake to generate your build files and then compile your code to generate the binary.
There is a command line way to work with CMake but just to make things easier, we will use the cmake gui.
You can call the gui by typing ```cmake3-gui``` on the terminal.

![Alt text](https://github.com/deepaksamuel/ehep-2023/blob/5813fbfefa253839e4fb65a8f2e34fe0c221aa1b/img/cmake-root.png "a title")

The first three steps are generic whenever you compile from sources (you will do the same for Geant4 as well).
  1. Choosing the location where your source code resides: The easy download script places the source code in the root folder
  2. Choosing the location for your build files: The build folder inside root folder is used for this purpose
  3. Choosing the location for your install files: The install folder inside root folder is used for this purpose

The fourth step is where you choose additional options for your root installation. If you scroll down you will see options like ```pyroot``` and ```roofit``` which you should enable as they will be used in the school.

The fifth step is clicking on the ```configure``` button which leads you to another popup asking you to choose the compiler and so on. The default option is ```use default native compilers``` with ```Unix Makefiles``` in the dropdown. Unless you know what you are doing, accept the defaults. If you see no erros reported in the log, you can go on to the next step. In case of errors, you may have to install additional dependencies reported therein. 

The final step is clicking on the ```Generate`` button. Once again, you may have to check for any errors reported at this stage.

### Compiling the code
Now that the build files are created, you are now ready to compile your code.

- On a terminal window, cd to ```build``` folder inside ```ehep/root```

- type ```make -j4``` to begin compiling

- wait for 30 - 45 minutes
  
- If the compiling is successful, type ```make install```  


## Instructions for installing Geant4
### Invoking CMake
We will follow the same instructions as used for root installation
Call ```cmake3-gui``` on the terminal.

![Alt text](https://github.com/deepaksamuel/ehep-2023/blob/f03ca7dd115b7b0ec88615d4a02792cf86207044/img/cmake-geant4.png "a title")

The steps are as follows:
  1. Set the source location
  2. Set the location for your build files: The build folder inside g4 folder is used for this purpose
  3. Set the location  for your install files: The install folder inside g4 folder is used for this purpose
  4. Set the location for the data files: The data folder inside g4 folder is used for this purpose

The fifth step is where you choose additional options for your Geant4 installation. Please make sure that the following options are checked:
- GEANT4_BUILD_MULTITHREADED
- GEANT4_USE_GDML
- GEANT4_USE_OPENGL_X11
- GEANT4_USE_QT

IMPORTANT: Please uncheck the ```GEANT4_INSTALL_DATA``` or else the datasets will be automatically downloaded again

The sixth step is clicking on the ```configure``` button which leads you to another popup asking you to choose the compiler and so on.  The default option is ```use default native compilers``` with ```Unix Makefiles``` in the dropdown. Unless you know what you are doing, accept the defaults. If you see no erros reported in the log, you can go on to the next step. In case of errors, you may have to install additional dependencies reported therein. 

The sevent step is clicking on the ```Generate`` button. Once again, you may have to check for any errors reported at this stage.

### Compiling the code
Now that the build files are created, you are now ready to compile your code.

- On a terminal window, cd to ```build``` folder inside ```ehep/g4```

- type ```make -j4``` to begin compiling

- wait for 45 - 60 minutes
  
- If the compiling is successful, type ```make install```  

### Running ROOT
If everything is done, you should be able to run ROOT. For this, on a terminal cd to  ```ehep/root/install/bin``` and type:

```source thisroot.sh```

Then type, 

```root```

You should see the ROOT command prompt coming up.



