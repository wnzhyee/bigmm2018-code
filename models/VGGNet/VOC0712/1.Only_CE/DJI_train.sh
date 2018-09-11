cd caffe/
./build/tools/caffe train \
--solver="solver.prototxt" \
--weights="VGG_ILSVRC_16_layers_fc_reduced.caffemodel" \
--gpu 0,1 2>&1 | tee train.log
