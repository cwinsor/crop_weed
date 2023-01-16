#! /bin/bash

TESTPREFIX="010a"
MODEL='fcos_resnet50_fpn'
DATASET='coco'
WEIGHTS='none'

EPOCHS=1
BATCH_SIZE=2

#-----
FULLTESTNAME=$TESTPREFIX'_'$MODEL'_'$DATASET'_'$WEIGHTS
OUTDIR='../output/'$FULLTESTNAME

echo $OUTDIR
[ ! -d $OUTDIR ] && mkdir $OUTDIR

torchrun \
--nproc_per_node 2 \
train_001.py \
--output_dir $OUTDIR \
--dataset $DATASET \
--model $MODEL \
--epochs $EPOCHS \
 \
--lr-steps 16 22 \
--aspect-ratio-group-factor 3 \
--batch_size $BATCH_SIZE \
2>&1 | tee $OUTDIR/run.log

cp $TESTPREFIX.sh $OUTDIR
DATETIME=$(date +%y%m%d_%H%M)
mv $OUTDIR $OUTDIR__$DATETIME


