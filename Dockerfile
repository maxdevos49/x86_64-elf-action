FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Get required tools which have packages
RUN apt-get update \
	&& apt-get install wget -y \
	&& apt-get install build-essential -y --no-install-recommends \
	&& apt-get install nasm \
	&& apt-get install mtools \
	&& apt-get install xorriso -y \
	&& apt-get install gdisk -y \
	&& apt-get install texinfo -y

# Build Cross compiler binutils
RUN wget https://ftp.gnu.org/gnu/binutils/binutils-2.43.1.tar.xz \
	&& tar Jxf binutils-2.43.1.tar.xz \
	&& mkdir binutils \
	&& cd binutils \
	&& ../binutils-2.43.1/configure --prefix=/usr/local --target=x86_64-elf --program-prefix=x86_64-elf- \ 
	&& make all \
	&& make install

RUN wget https://ftp.gnu.org/gnu/gcc/gcc-14.2.0/gcc-14.2.0.tar.xz \
	&& tar Jxf gcc-14.2.0.tar.xz \
	&& mkdir gcc \
	&& cd gcc-14.2.0 && ./contrib/download_prerequisites && cd ..\
	&& cd gcc \
	&& ../gcc-14.2.0/configure --prefix=/usr/local --target=x86_64-elf --program-prefix=x86_64-elf- \
	&& make -j$(nproc) all \
	&& make install


# Set the working directory inside the container.
WORKDIR /usr/src

# Copy any source file(s) required for the action.
COPY entrypoint.sh .

# Configure the container to be run as an executable.
ENTRYPOINT ["/usr/src/entrypoint.sh"]
