# ehep-2023
Installation notes for ROOT and Geant4

## Download links

| Software | Download Link (tested for Ubuntu)                                                                                                                                                   | Install command                                                                                   |
|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| Anaconda | https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-x86_64.sh  (~ 1 GB)<br>Refer https://www.anaconda.com/download for other OS                                             | ```chmod +x Anaconda3-2023.07-2-Linux-x86_64.sh```<br>```./Anaconda3-2023.07-2-Linux-x86_64.sh``` |
| Snap     | Direct install <br>Refer https://snapcraft.io/docs/installing-snap-on-ubuntu for other OS                                                                                           | ```sudo apt update```<br>```sudo apt install snapd```                                             |
| VSCode   | Direct install (~ 70 MB)<br>Refer https://code.visualstudio.com/ for more information                                                                                               | ```sudo snap install code --classic```                                                            |
| Git      | Direct install (~ 20 MB)                                                                                                                                                            | ```sudo snap install git-ubuntu --classic```                                                      |
| CMake    | Direct Install (~ 5 MB)                                                                                                                                                             | ```sudo snap install cmake --classic```                                                           |
| ROOT     | https://root.cern/download/root_v6.28.06.source.tar.gz (~200 MB)                                                                                                                    | To be discussed, refer to https://root.cern/install/ for requirements for your system             |
| Geant4   | https://gitlab.cern.ch/geant4/geant4/-/archive/v11.1.2/geant4-v11.1.2.tar.gz (~450 MB)<br>Datasets to be downloaded separately from https://geant4.web.cern.ch/download/11.1.2.html | To be discussed …                                                                                 |

## Geant4 datasets

For Geant4 simulations to run, you need to download the datasets on to your computer:

Go to: https://geant4.web.cern.ch/download/11.1.2.html

Download all the datasets therein into the ‘data’ folder inside g4

## Folder structure

For the sake of this preschool, we propose to use this folder structure:
- Create a main directory called `ehep`, preferably on the Desktop
- Inside of ehep, create three directories (along with the subdirectories as shown below
  - `downloads`
  - `g4`
    - `build`
    - `install`
    - `data`   
  - `root
    - `build`
    - `install`
    - `data`    
