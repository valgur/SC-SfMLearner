#!/bin/bash
set -euo pipefail
source .env

DATASET_DIR="$KITTI_ODOM/sequences/"
OUTPUT_DIR="$RESULTS_DIR/vo/cs+k_pose/"

POSE_NET="$MODELS_ROOT/cs+k_pose.tar"

# save the visual odometry results to "results_dir/09.txt"
python test_vo.py \
--img-height 256 --img-width 832 \
--sequence 09 \
--pretrained-posenet "$POSE_NET" --dataset-dir "$DATASET_DIR" --output-dir "$OUTPUT_DIR"

# show the trajectory with gt. note that use "-s" for global scale alignment
evo_traj kitti -s "$OUTPUT_DIR/09.txt" --ref=./kitti_eval/09.txt -p --plot_mode=xz

