#!/bin/bash
export OMP_NUM_THREADS=3  # speeds up MinkowskiEngine

CURR_DBSCAN=0.95
CURR_TOPK=750
CURR_QUERY=150
BS=$1
CLIP_LOSS=0.3
EXP_NAME="CLIPlossTT${CLIP_LOSS}_512dim_BS${BS}"
PROJ_NAME="Mask3D_Scannet200"

# TRAIN
python main_instance_segmentation.py \
general.experiment_name=${EXP_NAME} \
general.project_name=${PROJ_NAME} \
data/datasets=scannet200 \
general.num_targets=201 \
data.batch_size=${BS} \
general.save_dir="saved/${PROJ_NAME}/${EXP_NAME}" \
data.num_labels=200 \
general.eval_on_segments=true \
general.train_on_segments=true

# TEST
# python main_instance_segmentation.py \
# general.experiment_name="CLIP_contrast_init_query_${CURR_QUERY}_topk_${CURR_TOPK}_dbscan_${CURR_DBSCAN}" \
# general.project_name="Mask3D_Scannet200_eval" \
# general.checkpoint="checkpoints/scannet200/CLIP_contrast_init.ckpt" \
# data/datasets=scannet200 \
# general.num_targets=201 \
# data.num_labels=200 \
# general.eval_on_segments=true \
# general.train_on_segments=true \
# general.train_mode=false \
# model.num_queries=${CURR_QUERY} \
# general.topk_per_image=${CURR_TOPK} \
# general.use_dbscan=true \
# general.dbscan_eps=${CURR_DBSCAN}
