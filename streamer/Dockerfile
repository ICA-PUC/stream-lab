FROM nvidia/cuda:11.8.0-base-ubuntu22.04

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
ENV PATH="/root/ffmpeg_source/ffmpeg:${PATH}"
ARG PATH="/root/ffmpeg_source/ffmpeg:${PATH}"
ARG DEBIAN_FRONTEND=noninteractive

COPY environment.yml /tmp/environment.yml

RUN rm -f /etc/apt/sources.list.d/*.list
RUN apt-get update && \
    apt-get install -y ca-certificates openssl libssl-dev \
    build-essential curl sudo git bzip2 unzip libsdl1.2-dev \
    libx11-6 libx264-dev libx265-dev libnuma-dev libsm6 \
    libxext6 libgl1-mesa-glx yasm autoconf automake cmake \
    git-core libass-dev libfreetype6-dev libgnutls28-dev \
    libsdl2-dev libtool libva-dev libvdpau-dev \
    libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev \
    pkg-config texinfo wget nasm zlib1g-dev nano libvpx-dev \
    libfdk-aac-dev libmp3lame-dev libopus-dev libaom-dev libunistring-dev \
    nmap net-tools && \
    rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh \
    && conda env create -n dvc-env --file /tmp/environment.yml

RUN mkdir /app
WORKDIR /app

# Build FFMPEG
# ffmpeg build
RUN mkdir -pv ~/ffmpeg_source ~/bin \
    && cd ~/ffmpeg_source \
    && wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 \
    && tar -xvf ffmpeg-snapshot.tar.bz2 \
    && cd ffmpeg \
    && PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
    --prefix="$HOME/ffmpeg_build" \
    --pkg-config-flags="--static" \
    --extra-cflags="-I$HOME/ffmpeg_build/include" \
    --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
    --extra-libs="-lpthread -lm" \
    --bindir="$HOME/bin" \
    --enable-gpl \
    --enable-gnutls \
    --enable-libaom \
    --enable-libass \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libx265 \
    --enable-nonfree \
    && make -j4 \
    && make install \
    && hash -r

CMD [ "/bin/bash" ]
