container_name_from_image() {
    CONTAINER_NAME="${DISTRO}"
    for char in / : ; do
        CONTAINER_NAME="${CONTAINER_NAME//$char/-}"
    done
}

is_run_as_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "This script must be run as root."
        exit 1
    fi
}

unmount_and_clean() {    
    echo "Cleaning up ${CONTAINER_NAME} and ${MOUNT_DIR} directory..."
    read -rp $"Container and its filesystem will be removed. Are you sure? [y/n] "
    if [ "${REPLY}" != "y" ]; then
        echo "Nothing has been done. You'll have to clean manually."
        exit 1
    fi

    umount -Rl "${MOUNT_DIR}/"{sys,proc,dev/pts,dev}
    rm -rf "${MOUNT_DIR}"
    docker rm "${CONTAINER_NAME}" > /dev/null
}