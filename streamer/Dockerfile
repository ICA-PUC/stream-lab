FROM nvidia/cuda:11.8.0-base-ubuntu22.04

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
    libfdk-aac-dev libmp3lame-dev libopus-dev libaom-dev && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

# Create non-root user and switch to it.
RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
    && chown -R user:user /app

RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# All users can use /home/user as their home directory
ENV HOME=/home/user
RUN mkdir $HOME/.cache $HOME/.config \
    && chmod -R 777 $HOME

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

# install micromamba
RUN curl -sL https://micro.mamba.pm/api/micromamba/linux-64/1.1.0 \
    | sudo tar -xvj -C /usr/local bin/micromamba

ENV MAMBA_EXE=/usr/local/bin/micromamba \
    MAMBA_ROOT_PREFIX=/home/user/micromamba \
    CONDA_PREFIX=/home/user/micromamba \
    PATH=/home/user/micromamba/bin:$PATH

# set up the base conda env by install pytorch and friend
COPY environment.yml /app/environment.yml

RUN micromamba create -qy -n base -f /app/environment.yml \
    && rm /app/environment.yml \
    && micromamba shell init --shell=bash --prefix="$MAMBA_ROOT_PREFIX" \
    && micromamba clean -qya

ENTRYPOINT [ "docker-entrypoint.sh" ]
