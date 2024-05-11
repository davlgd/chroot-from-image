# Chroot from image

This repository contains a simple Bash script to `chroot` in any Linux distribution. Its filesystem is extracted from a docker image and then mounted. You can learn more in my [dedicated blog post](https://labs.davlgd.fr/posts/2024-05-chroot-to-any-linux-to-test-it/).

## Usage

```bash
./chroot-from-image <image> <command>
```

## Example

```bash
./chroot_from_image centos
./chroot_from_image ubuntu:20.04
./chroot_from_image alpine /bin/sh
./chroot_from_image exherbo/exherbo-x86_64-pc-linux-gnu-gcc-base
```

This also works with [Podman](https://podman.io/) and alternative hubs, if configured to be used from the `docker` command.

# Unmounting and cleaning

Mounted directories and exported container are automatically cleaned up when you exit the `chroot` environment. If you need to clean up manually, there is the `clean_image` script.

## Usage

```bash
./clean_image <image>
```

## Example

```bash
./clean_image centos
./clean_image ubuntu:20.04
./clean_image alpine
./clean_image exherbo/exherbo-x86_64-pc-linux-gnu-gcc-base
```

# License

This project is under the [MIT License](LICENSE).
```

[]: # Path: LICENSE