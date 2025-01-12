#!/bin/bash
export OMP_NUM_THREADS=3  # speeds up MinkowskiEngine

CURR_DBSCAN=0.95
CURR_TOPK=300
CURR_QUERY=150
CURR_T=0.001

# TRAIN
python main_instance_segmentation.py \
general.experiment_name="CLIP_contrast_base" \
general.project_name="Mask3D_Scannet200" \
data/datasets=scannet200 \
general.num_targets=201 \
data.num_labels=200 \
general.eval_on_segments=true \
general.train_on_segments=true \
data.train_mode=train_validation

# TEST
python main_instance_segmentation.py \
general.experiment_name="CLIP_contrast_base_${CURR_QUERY}_topk_${CURR_TOPK}_dbscan_${CURR_DBSCAN}_export_${CURR_T}" \
general.project_name="Mask3D_Scannet200_eval" \
general.checkpoint="checkpoints/scannet200/CLIP_contrast_base.ckpt" \
data/datasets=scannet200 \
general.num_targets=201 \
data.num_labels=200 \
general.eval_on_segments=true \
general.train_on_segments=true \
general.train_mode=false \
model.num_queries=${CURR_QUERY} \
general.topk_per_image=${CURR_TOPK} \
general.use_dbscan=true \
general.dbscan_eps=${CURR_DBSCAN} \
general.export=true \
data.test_mode=test \
general.export_threshold=${CURR_T}
