podman build --network host -t kernel_crash .
podman  run  -it  --privileged -v /home/dhill:/home/dhill localhost/kernel_crash:latest  bash

# crash  /usr/lib/debug/lib/modules/4.18.0-305.25.1.el8_4.x86_64/vmlinux 0070-vmcore
