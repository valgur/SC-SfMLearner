#!/bin/bash
set -euo pipefail
source .env

TRAIN_SET="$KITTI_ODOM_256"
python train.py "$TRAIN_SET" \
--dispnet DispResNet \
--num-scales 1 \
-b4 -s0.1 -c0.5 --epoch-size 1000 --sequence-length 3 \
--with-mask True \
--with-ssim True \
--name posenet_256
