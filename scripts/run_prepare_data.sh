#!/bin/bash
set -euo pipefail
source .env

# for kitti raw dataset
DATASET="$KITTI_RAW"
TRAIN_SET="$KITTI_256"
STATIC_FILES=data/static_frames.txt
python data/prepare_train_data.py "$DATASET" --dataset-format 'kitti_raw' --dump-root "$TRAIN_SET" --width 832 --height 256 --num-threads 4 --static-frames $STATIC_FILES --with-depth

# # for cityscapes dataset
# DATASET="$CITYSCAPES"
# TRAIN_SET="$CITYSCAPES_256"
# python data/prepare_train_data.py "$DATASET" --dataset-format 'cityscapes' --dump-root "$TRAIN_SET" --width 832 --height 342 --num-threads 4

# # for kitti odometry dataset
# DATASET="$KITTI_ODOM"
# TRAIN_SET="$KITTI_ODOM_256"
# python data/prepare_train_data.py "$DATASET" --dataset-format 'kitti_odom' --dump-root "$TRAIN_SET" --width 832 --height 256 --num-threads 4
