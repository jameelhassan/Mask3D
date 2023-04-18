#!/bin/bash
export OMP_NUM_THREADS=3  # speeds up MinkowskiEngine

CURR_DBSCAN=0.95
CURR_TOPK=500
CURR_QUERY=150
BS=$1
CLIP_LOSS=0.3
EXP_NAME="CLIP_lossTT${CLIP_LOSS}_512dim_BS${BS}"
PROJ_NAME="Mask3D_Scannet"

# TRAIN
python main_instance_segmentation.py \
general.experiment_name=${EXP_NAME} \
general.project_name=${PROJ_NAME} \
data.batch_size=${BS} \
general.save_dir="saved/${PROJ_NAME}/${EXP_NAME}" \
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
