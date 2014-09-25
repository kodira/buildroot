# NOTE #1: extracting the root filesystem image to the system partition must be
#          executed as root to have the proper rights on all files 
# NOTE #2: hardcoded paths ahead. Proceed with caution. If you use this and
#          mess anything up in your system as a result, I will dismiss all
#          responsibility for it. You have been warned.

KERNEL_IMAGE_FILE=output/images/zImage
ROOT_IMAGE_FILE=output/images/rootfs.tar

BOOT_MOUNT=/var/run/media/markus/9DCF-4197
ROOT_MOUNT=/var/run/media/markus/b0213335-5f67-43a6-a6f7-8fa4e1c645b7

cp ${KERNEL_IMAGE_FILE} ${BOOT_MOUNT}
rm -r ${ROOT_MOUNT}/*
tar -xf ${ROOT_IMAGE_FILE} -C $(ROOT_MOUNT}
