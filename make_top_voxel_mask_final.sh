#! /bin/bash 
#
#SBATCH --job-name=make_top_voxel_mask
#SBATCH --ntasks=1 
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=50G
#SBATCH --cpus-per-task=2
#SBATCH --time=1:00:00
#SBATCH --partition=long
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lucinda.sisk@yale.edu

#You will need to load fsl module/conda for your cluster
# Takes in a results directory from fcma analysis and a certain number of voxels to threshold for a mask as input

module load FSL/6.0.3

# source it 
. /gpfs/milgram/apps/hpc.rhel7/software/FSL/5.0.10-centos7_64/etc/fslconf/fsl.sh

# Take inputs
input_dir=$1  # What is the path to thedata?
voxel_number=$2  # What voxel threshold would you like to set
output_dir=$3  # Where do you want to put the data
mask_file=$4

# Create output_dir
if [ ! -d ${output_dir} ]; then
  mkdir ${output_dir}
fi

# Iterate through each volume in the fcma directory
for file in ${input_dir}/*.nii.gz ; do
    # Preprocess the file name
    fbase=$(basename "$file")
    pref="${fbase%%.*}"
    
    # Create the voxel mask
    fslmaths $file -mas $mask_file ${output_dir}/${pref}_masked.nii.gz
    fslmaths ${output_dir}/${pref}_masked.nii.gz -uthr $voxel_number -bin ${output_dir}/${pref}_top${voxel_number}.nii.gz

done

# Concatenate all of the masks from each volume
fslmerge -t ${output_dir}/all_top${voxel_number} ${output_dir}/sub*top${voxel_number}.nii.gz

# Create a probability map of each voxel being included across participants
fslmaths ${output_dir}/all_top${voxel_number} -Tmean ${output_dir}/prop_top${voxel_number}.nii.gz -odt float
