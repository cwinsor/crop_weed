# crop_weed
This repo is a set of experiments in detection, classification and segmentation of weeds and crops from images.

Research associated with this work is published in the paper <http://to_be_provided>

 Transfer learning has made powerful machine vision models available for a wide range of tasks by significantly decreasing the amount of data required, and reducing the retraining computational resources needed. In the process however they have also introduced a plethora of choices to be made when implementing a machine vision system for a paractical application. 
 
 The paper investigates tradeoffs to be made when applying transfer learning in a practical machine vision application. Our chosen task is detection, localization and classification of weeds and crops in a natural field setting. We investigate various machine vision backbones, pre-trained models, re-training algorithms and metrics used during retraining. We use a handful of weed/crop datasete and investigate how factors associated with the dataset (size/scale of images, positioning/pose, background, number of objects/image, number of classes/image, total number of images, number of labels) are factors in choice of backbone and pre-trained weight selection. We consider metrics used in re-training (x, y, z) and the advantages and tradeoffs here in performance of the final model. Finally we investigate computational performance and requirements during re-training (GPU count/memory, processing time) as well as runtime (latency, GPU requirement) 


The toolset is torchvision with code based on examples in that module.

Further details including how to run tests and results from our experiments can be found at https://github.com/cwinsor/crop_weed/blob/main/RECIPE.md

