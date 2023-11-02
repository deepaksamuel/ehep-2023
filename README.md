# ehep-2023
**Installation notes for ROOT and Geant4**

Deepak Samuel, Central University of Karnataka

To view these slides as html presentations:

Go to: 

      https://htmlpreview.github.io/?https://github.com/deepaksamuel/ehep-2023/blob/main/installation-slides.html

The video lectures are found at:
      
      https://www.youtube.com/playlist?list=PLmgzo3mGMNquu4Q18v0MJ4IjJ5PSI0XgX

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

Go to: 

      https://geant4.web.cern.ch/download/11.1.2.html

Download all the datasets therein into the ‘data’ folder inside g4

## Dependencies
To install the dependencies, use the following commands
      
- ROOT
- 
  -     sudo apt-get install dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev python libssl-dev
-
  -        sudo apt-get install gfortran libpcre3-dev xlibmesa-glu-dev libglew-dev libftgl-dev libmysqlclient-dev libfftw3-dev libcfitsio-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python-dev python-numpy libxml2-dev libkrb5-dev libgsl0-dev qtwebengine5-dev libxmu-dev libxft-dev libssl-dev
   
- Geant4
  - GDML:
  -       sudo apt-get install -y libxerces-c-dev
  - libXMu:
  -       sudo apt-get install -y libxmu-dev
  - Qt:
  -       sudo apt-get install qtbase5-dev
  -       sudo apt-get install qtdeclarative5-dev
  - OpenSSL: s
  -       sudo apt-get -y install build-essential openssl libssl-dev libssl1.0 libgl1-mesa-dev libqt5x11extras5
  

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

Once saved, on your terminal execute the command 
            
      source ehep.sh

Please note that this script will also download the Geant4 datasets which may be extremely time consuming. However, as soon as the datasets downloading begins, parallely you can compile other codes. 

Do not close the terminal in which the ehep.sh script is running. Open a new terminal for parallely compiling the other programmes.

## Instructions for installing Anaconda
Please invoke these commands from the terminal after ```cd``` ing to the location where the binary was downloaded: 

- ```cd ehep/downloads```
-  ```chmod +x Anaconda3-2023.07-2-Linux-x86_64.sh```
-  ```./Anaconda3-2023.07-2-Linux-x86_64.sh```

Please watch out for these screens:
 
![Alt text](https://github.com/deepaksamuel/ehep-2023/blob/dc87bb87b6e36d6f3d652b396141911e06aaeb31/img/anaconda-installation.png  "a title")

### Python libraries required for EHEP 2023 can be installed using conda or pip. The commands for conda are given below:

- conda install -c anaconda jupyter
- conda install -c conda-forge jupyter-lsp
- conda install -c conda-forge nbdime
- conda install -c conda-forge jupyterlab-git
- conda install -c conda-forge scikit-learn
- conda install -c conda-forge seaborn
- conda install -c conda-forge tensorflow
- conda install -c conda-forge keras
- conda install -c pytorch pytorch
- conda install -c conda-forge dask
- conda install -c conda-forge libxgboost
- conda install -c conda-forge qutip
- conda install -c conda-forge qiskit-terra
- conda install -c conda-forge qiskit-metal

### Important: Do not mix pip install and conda install as they will result in conflicts. 


## Instructions for installing ROOT
### Invoking CMake-GUI
Most often, softwares used in HEP are distributed as source codes than binaries. In such a case, you will have to use CMake to generate your build files and then compile your code to generate the binary.
There is a command line way to work with CMake but just to make things easier, we will use the cmake gui.
You can call the gui by typing ```cmake3-gui``` on the terminal.

![Alt text](https://github.com/deepaksamuel/ehep-2023/blob/5813fbfefa253839e4fb65a8f2e34fe0c221aa1b/img/cmake-root.png "a title")

The first three steps are generic whenever you compile from sources (you will do the same for Geant4 as well).
  1. Choosing the location where your source code resides: The easy download script places the source code in the root folder
  2. Choosing the location for your build files: The build folder inside root folder is used for this purpose
  3. Choosing the location for your install files: The install folder inside root folder is used for this purpose

The fourth step is where you choose additional options for your root installation. If you scroll down you will see options like ```pyroot``` and ```roofit``` which you should enable as they will be used in the school. 

### Important:
It is often the case that the python installed by Anaconda distribution conflicts with your many other python distributions on your computer. If you want your ROOT to be compiled with the python from Anaconda distribution, you may have to set the CMake variable appropriately. For example, I have set ```CMAKE_INSTALL_PYTHONDIR``` to ```/home/samuel/anaconda3/bin/```.

The fifth step is clicking on the ```configure``` button which leads you to another popup asking you to choose the compiler and so on. The default option is ```use default native compilers``` with ```Unix Makefiles``` in the dropdown. Unless you know what you are doing, accept the defaults. If you see no erros reported in the log, you can go on to the next step. In case of errors, you may have to install additional dependencies reported therein. 

The final step is clicking on the ```Generate``` button. Once again, you may have to check for any errors reported at this stage.

### Using CMake command line
If you want know how to invoke cmake steps that you did in the earlier step using GUI, using the command line, here it is:
First cd to the build folder inside root directory:

  - ```cd ehep/root/build```
and then
- ```cmake -DCMAKE_INSTALL_PREFIX=../install ../root-6.28.06/ -Dpyroot=ON -Drootfit=ON -DPython3_EXECUTABLE=/home/codespace/anaconda3/bin/python```

Note that the above step has to be done only if you are not using the Cmake-Gui. 

### Compiling the code
Now that the build files are created, you are now ready to compile your code.

- On a terminal window, cd to ```build``` folder inside ```ehep/root```

- type ```make -j4``` to begin compiling

- wait for 30 - 45 minutes
  
- If the compiling is successful, type ```make install```  

### Running ROOT
If everything is done, you should be able to run ROOT. For this, on a terminal cd to  ```ehep/root/install/bin``` and type:

```source thisroot.sh```

Then type, 

```root```

You should see the ROOT command prompt coming up.

![Alt text](https://github.com/deepaksamuel/ehep-2023/blob/fa33b5dec029ec533230b8dcfe6c1854e520084f/img/root-prompt.png "a title")

You must source thisroot.sh every time you open a new terminal. In case you intend to use ROOT frequently, this may be inconvenient. You should instead add this line to your bash.rc file.

### Running a ROOT Jupyter notebook:
First make sure that the thisroo.sh script is sourced and execute the following command from the terminal:

      root --notebook --no-browser

This command will output a url which you can copy and paste it on a browser to start a jupyter notebook for root scripts. Alternatively, you can also start a Jupyter notebook inside VSCode.

There are two types of ROOT scripts: the python-based and C++ interpreter based. For the python based script, you should choose the ipykernel and for C++ scripts, you should choose the ROOT C++ kernel, in the Jupyter notebook. 

### Other ways to install / run ROOT
- To know more about build ROOT from source and other options, please go to: https://root.cern/install/build_from_source/
- Other ways to install: https://root.cern/install/

## Instructions for installing Geant4
### Invoking CMake-GUI
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

The sevent step is clicking on the ```Generate``` button. Once again, you may have to check for any errors reported at this stage.

### Compiling Geant4 using CMake command line

- ```cmake -DCMAKE_INSTALL_PREFIX=../install ../geant4-v11.1.2/ -DGEANT4_USE_GDML=ON -DGEANT4_INSTALL_DATADIR=../data -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_QT=ON```

### Compiling the code
Now that the build files are created, you are now ready to compile your code.

- On a terminal window, cd to ```build``` folder inside ```ehep/g4```

- type ```make -j4``` to begin compiling

- wait for 45 - 60 minutes
  
- If the compiling is successful, type ```make install```  


### Setting the Geant4 environment
Every time you run a Geant4 code, you must source this script ```geant4.sh``` will is found in the ```ehep/g4/install/bin folder```

- ```source ehep/g4/install/bin/geant4.sh```

failing which, you will not be able to compile the code successfully. If you are frequently developing Geant4 code, it is best to source this in your .bashrc file.

### More compile options for Geant4

Please go to this link for more build options in Geant4: 

- https://geant4-userdoc.web.cern.ch/UsersGuides/InstallationGuide/html/installguide.html#geant4-build-options


