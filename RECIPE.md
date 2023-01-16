
To run it is necessary to set path to the reference code under /vision ... for example:
export PYTHONPATH=/mnt/d/code_crop_weed/crop_weed/vision/references/detection/

# Platform:
* Single host Windows 10
* 2 GPUs (12GB each) NVIDEA GeForce RTX 3060
* Windows Subsystem for Linux (WSL) Ubuntu-20.04
* VS-Code using the WSL extender. A .vscode/launch.json is provided for running the tests.

# Architecture:
Architecture is Torchvision with Multi-GPU support is by torchrun. The tests are based on examples from github.com/pytorch/vision/references/detection.

# Repo Structure:
* /vision is a git sub-module of the pytorch/vision git (see https://git-scm.com/book/en/v2/Git-Tools-Submodules for info on sub-modules)
* /experiments is code for the experiments
* /results is output of the experiments

With respect to (CR/LF) injection we use the generally-accepted approach whereby Windows environments convert to (CR/LF) during local work but convert back to Linux-style (LF) during commit. This is the default setting for git in Windows. In bash the git command to ignore these local changes is "git config --global core.autocrlf input" (details see https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#_core_autocrlf). Bottom line: Windows users should commit using linx-style.

## Datasets:
* x
* y

## Model Backbone and Pre-trained Weights
* x
* y

## Re-training Algorithm
* x
* y

## Re-training Metrics
* x


# Recipe (how to deploy/run)

1. From Win10 enable WSL (ref?) Ubuntu 20
1. All following are within WSL:
1. install conda
1. create conda environment:
    * conda create --name <> python=3.9
    * and activate it
1. add torch (https://pytorch.org/get-started/locally/) versions
    * pytorch 1.13
    * CUDA 11.7
1. above should give you torchvision (0.14)
1. add pycocotools https://anaconda.org/conda-forge/pycocotools

In powershell
1. install VS-Code allowing "add to path" to allow "code ." in WSL/bash.
1. add WSL extender (https://code.visualstudio.com/docs/remote/wsl)

In WSL/bash:
1. code -n .



# --- NOTES ---

---------------------------

TORCHVISION:
https://pytorch.org/vision/stable/index.html
https://github.com/pytorch/vision
https://github.com/pytorch/vision/blob/main/references/detection/README.md
Summary :  The torchvision package consists of popular datasets, model architectures, and common image transformations for computer vision.

---------------------------

Training References
https://github.com/pytorch/vision/tree/main/references
Summary: The training references are a sub-folder of vision/
I have cloned the vision/ tree here, so those references are found here.
Most of my focus will be on vision/dection

---------------------------

"torchrun" command line...
torchrun --nproc_per_node=1 my_train.py --dataset coco --model fasterrcnn_resnet50_fpn --epochs 26 `
--lr-steps 16 22 --aspect-ratio-group-factor 3 --weights-backbone ResNet50_Weights.IMAGENET1K_V1
and this WORKS on WSL.  Windows however gives "failed to start". We believe torchrun is early prototype and Windows support is no there.

--------------------------

WINDOWS:
For pre-testing the COCO dataset and installing "pycocotools":
    run the "cocoapi" using jupyter notebook (on windows).  See:
    https://github.com/cocodataset/cocoapi
    https://github.com/cocodataset/cocoapi/issues/272
when install pycocotools - see  https://github.com/philferriere/cocoapi  !!!
investigating torch.distributed.launch (the predecessor to torchrun) see https://pytorch.org/docs/stable/distributed.html#launch-utility

--------------------------

MODELS AND PRE-TRAINED WEIGHTS
https://pytorch.org/vision/main/models.html#models-and-pre-trained-weights

https://pytorch.org/vision/stable/datasets.html

