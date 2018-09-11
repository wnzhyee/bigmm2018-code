# Real-time Vehicle Detection from UAV Imagery

[![License](https://img.shields.io/badge/license-BSD-blue.svg)](LICENSE)

By Xuemei Xie, Wenzhe Yang, Guimei Cao, etc.

### Introduction

We proposed a novel UAV vehicle detector. The network is based on [Refinedet](https://github.com/sfzhang15/RefineDet), we improve it by generating more suitable bounding boxes and we propose a dynamic training strategy, which can help our model achieve the state-of-art accuracy on [UAV dataset](https://share.weiyun.com/5M4sC7I) detection. More details please refer to the [paper](Real-timeVehicleDetectionfromUAVImagery.pdf).


| System                                               | UAV dataset test *mAP* | **FPS** |
|:-------                                              |:-----:                 |:-------:|
| [YOLO](http://pjreddie.com/darknet/yolo/)            | 53.7                   | **64**      |
| [SSD300](https://github.com/weiliu89/caffe/tree/ssd) | 83.3                   | 59      |
| [Refinedet](https://github.com/sfzhang15/RefineDet)  | 87.1                   | 40      |
| Our preposed                                         | **90.8**               | 59      |

### Contents
1. [Installation](#installation)
2. [Preparation](#preparation)
3. [Training](#training)
4. [Evaluation](#evaluation)

### Installation
1. Get the code. We will call the cloned directory as `$caffe`.
  ```Shell
  git clone https://github.com/wnzhyee/bigmm2018-code.git
  ```

2. Build the code. Please follow [Caffe instruction](http://caffe.berkeleyvision.org/installation.html) to install all necessary packages and build it.
  ```Shell
  cd $caffe
  # Modify Makefile.config according to your Caffe installation.
  # Make sure to include $caffe/python to your PYTHONPATH.
  cp Makefile.config.example Makefile.config
  make all -j && make py
  ```

### Preparation
1. Download [UAV dataset](https://share.weiyun.com/5M4sC7I). The dataset is prepared in VOC2007 style, and we provide the image files in ‘JPEGImages/’, the annotations files are in 'Annotations/'.

2. Create .lmdb files uses the [create_list](data/VOC0712/create_list.sh) and [create_data](data/VOC0712/create_data.sh) file.

### Training
Train your model on PASCAL VOC. First change the path in DJI_train.sh shell and solver.prototxt(they are in $caffe/models/VGGNet/VOC0712/**method_folder**/), then run the train shell.
  ```Shell
  cd $caffe/models/VGGNet/VOC0712/**method_folder**/
  sh DJI_train.sh
  ```

**The method folder:**

1.Only CE: only train the model with cross-entropy loss, and the total iterations are 120k;

2.Only FL: only train the model with focal loss, and the total iterations are 120k;

3.DTS: train 100k iters with CE loss and another 20k iters with FL loss;

### Evaluation
The evaluation files are in $caffe/examples, please refer to the evaluation shells for [image det](examples/Test_images_DJI_6class.ipynb) and [vedio det](examples/Test_video_DJI_6class.ipynb).