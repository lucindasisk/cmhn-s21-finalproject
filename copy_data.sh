#! /bin/bash

ml load FSL/6.0.4-centos7_64

fldr='/gpfs/milgram/scratch60/gee_dylan/lms233/cmhn2021/cmhn-s21-finalproject/image_data'
rawdir='/gpfs/milgram/pi/gee_dylan/candlab/data/mri/hcp_pipeline_preproc/shapes'

# for sub in sub-A258 sub-A429 sub-A238 sub-A690 sub-A738 sub-A273 sub-A547 sub-A218 sub-A718 sub-A694 ; do
#     cp $rawdir'/'$sub'/MNINonLinear/Results/ses-shapesV1_task-shapes1_bold/ses-shapesV1_task-shapes1_bold_8dv.nii.gz' $fldr'/'$sub'_ses-shapesV1_task-shapes1_bold_8dv.nii.gz'
# done

# for sub in sub-A258 sub-A429 sub-A238 sub-A690 sub-A738 sub-A273 sub-A547 sub-A218 sub-A718 sub-A694 ; do
#     bet $fldr'/'$sub'_ses-shapesV1_task-shapes1_bold_8dv.nii.gz' $fldr'/'$sub'_ses-shapesV1_task-shapes1_bold_8dv_brain.nii.gz' -m -n
# done

cd $fldr
fslmaths sub-A258_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A429_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A238_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A690_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A738_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A273_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A547_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A547_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A218_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A718_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -add sub-A694_ses-shapesV1_task-shapes1_bold_8dv_brain_mask.nii.gz -bin combined_mask.nii.gz
    