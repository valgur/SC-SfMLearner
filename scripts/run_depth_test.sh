#!/bin/bash
set -euo pipefail
source .env

DATASET="$KITTI_RAW"
TEST_FILE=kitti_eval/test_files_eigen.txt
DISP_NET="$MODELS_ROOT/cs+k_depth.tar"

#  predict depth and save results to "results_dir/predictions.npy"
python test_disp.py --dispnet DispResNet --img-height 256 --img-width 832 \
 --pretrained-dispnet "$DISP_NET" --dataset-dir "$DATASET" --dataset-list $TEST_FILE \
 --output-dir "$RESULTS_DIR/depth"

# evaluate depth using SfMLearner original version (copy from tensorflow codes) for fair comparison
# please use python2.7
python ./kitti_eval/eval_depth.py --kitti_dir="$DATASET" \
--test_file_list $TEST_FILE \
--pred_file="$RESULTS_DIR/depth/predictions.npy"
