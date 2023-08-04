FROM archxlinux/archxlinux:latest
RUN pacman -Sy archiso --noconfirm
COPY archiso/airootfs/etc/pacman.conf /etc/pacman.conf
COPY archiso/airootfs/etc/pacman.d/archx-mirrorlist /etc/pacman.d/archx-mirrorlist
ADD build.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
