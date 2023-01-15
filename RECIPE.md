

Weed/Crop Experiments

This is a set of Pytorch vision experiments using Weed/Crop datasets.
Utilizes torchvision module and exammples/infrastructure from
https://github.com/pytorch/vision/references/detection


Platform:
Single host Windows 10
2 GPUs (12GB each) NVIDEA GeForce RTX 3060
Windows Subsystem for Linux (WSL) Ubuntu-20.04
VS-Code using the WSL extender. A .vscode/launch.json is provided for running the tests.

Architecture:
Architecture is Torchvision with Multi-GPU support is by torchrun. The tests are based on examples from github.com/pytorch/vision/references/detection.

Repo Structure:
/vision is a git sub-module of the pytorch/vision git (see https://git-scm.com/book/en/v2/Git-Tools-Submodules for info on sub-modules)
/experiments is code for the experiments
/results is output of the experiments

As Windows OS is nearby (CR/LF) injection may be an issue. We use the generally-accepted approach where Windows environments convert to (CR/LF) during local work, but convert back to Linux-style (LF) during commit. This is the default setting for git in Windows. In bash the git command to ignore these local changes is "git config --global core.autocrlf input" (details see https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_core_autocrlf). Bottom line: Windows users should commit using linx-style.

Datasets:
Models:


Recipe:

From Win10 enable WSL (ref?) Ubuntu 20
All following are within WSL:
install conda
create conda environment:
    conda create --name <> python=3.9
    and activate it
add torch (https://pytorch.org/get-started/locally/) versions
    pytorch 1.13
    CUDA 11.7
above should give you torchvision (0.14)
add pycocotools https://anaconda.org/conda-forge/pycocotools

In powershell
    install VS-Code allowing "add to path" to allow "code ." in WSL/bash.
    add WSL extender (https://code.visualstudio.com/docs/remote/wsl)

In WSL/bash:
    code .

...

