#!/bin/bash
set -euo pipefail
source .env

python train.py "$CITYSCAPES_256" \
--dispnet DispResNet \
--num-scales 1 \
-b4 -s0.1 -c0.5 --epoch-size 1000 --sequence-length 3 \
--with-mask True \
--with-ssim True \
--name cs_resnet_256
