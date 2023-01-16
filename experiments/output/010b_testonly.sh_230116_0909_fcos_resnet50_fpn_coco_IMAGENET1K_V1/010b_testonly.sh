#! /bin/bash

MODEL='fcos_resnet50_fpn'
DATASET='coco'
WEIGHTS='IMAGENET1K_V1'

EPOCHS=1
BATCH_SIZE=2

# ---
TESTFILENAME=`basename "$0"`
DATETIME=$(date +%y%m%d_%H%M)
FULLTESTNAME=$TESTFILENAME'_'$DATETIME'_'$MODEL'_'$DATASET'_'$WEIGHTS
OUTDIR='../output/'$FULLTESTNAME

# create the outdir if it doesn't exist
echo $OUTDIR
[ ! -d $OUTDIR ] && mkdir $OUTDIR

# copy the test to outdir
cp $TESTFILENAME $OUTDIR

# run the test tee output to outdir
torchrun \
--nproc_per_node 2 \
train_001.py \
--output_dir $OUTDIR \
--dataset $DATASET \
--model $MODEL \
--epochs $EPOCHS \
--weights-backbone $WEIGHTS \
--lr-steps 16 22 \
--aspect-ratio-group-factor 3 \
--batch_size $BATCH_SIZE \
--test-only \
2>&1 | tee $OUTDIR/run.log
