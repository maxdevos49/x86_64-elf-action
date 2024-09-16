FROM alpine:3.20

RUN apk update
RUN apk add build-base
RUN apk add --force-overwrite binutils-x86_64
RUN apk add nasm
RUN apk add make
RUN apk add xorriso
RUN apk add mtools
RUN apk add gptfdisk
RUN apk add curl
RUN apk add git
RUN apk add perl-utils

# Set the working directory inside the container.
WORKDIR /usr/src

# Copy any source file(s) required for the action.
COPY entrypoint.sh .

# Configure the container to be run as an executable.
ENTRYPOINT ["/usr/src/entrypoint.sh"]
