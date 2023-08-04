FROM archxlinux/archxlinux:latest
RUN pacman -Sy archiso --noconfirm
COPY archiso/etc/pacman.conf /etc/pacman.conf
COPY archiso/etc/pacman.d/archx-mirrorlist
ADD build.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
