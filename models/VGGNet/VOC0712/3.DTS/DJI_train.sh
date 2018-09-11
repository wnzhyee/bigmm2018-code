cd caffe/
./build/tools/caffe train \
--solver="solver.prototxt" \
--weights="train_iter_onlyCE_100000.caffemodel" \
--gpu 0 2>&1 | tee train.log
