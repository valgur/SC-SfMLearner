#!/bin/bash
set -euo pipefail
source .env

POSE_NET="$MODELS_ROOT/cs+k_pose.tar"

python test_pose.py "$POSE_NET" \
--img-height 256 --img-width 832 \
--dataset-dir "$KITTI_ODOM" \
--sequences 09
