from archxlinux:latest
RUN pacman -Sy archiso --noconfirm
ADD build.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
