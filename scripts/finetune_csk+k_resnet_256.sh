#!/bin/bash
set -euo pipefail
source .env

python train.py "$KITTI_RAW_256" \
--pretrained-disp= \
--pretrained-pose= \
--dispnet DispResNet \
--num-scales 1 \
-b4 -s0.1 -c0.5 --epoch-size 1000 --sequence-length 3 \
--with-mask True \
--with-ssim True \
--with-gt \
--name cs+k_resnet_256
