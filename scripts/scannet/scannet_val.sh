#!/bin/bash
export OMP_NUM_THREADS=3  # speeds up MinkowskiEngine

CURR_DBSCAN=0.95
CURR_TOPK=500
CURR_QUERY=150

# TRAIN
python main_instance_segmentation.py \
general.experiment_name="CLIP20_loss_init" \
general.project_name="Mask3D_Scannet" \
general.eval_on_segments=true \
general.train_on_segments=true 

# TEST
# python main_instance_segmentation.py \
# general.experiment_name="CLIP_contrast_init_${CURR_QUERY}_topk_${CURR_TOPK}_dbscan_${CURR_DBSCAN}" \
# general.project_name="Mask3D_Scannet" \
# general.checkpoint='checkpoints/scannet/CLIP_contrast_init.ckpt' \
# general.train_mode=false \
# general.eval_on_segments=true \
# general.train_on_segments=true \
# model.num_queries=${CURR_QUERY} \
# general.topk_per_image=${CURR_TOPK} \
# general.use_dbscan=true \
# general.dbscan_eps=${CURR_DBSCAN}
