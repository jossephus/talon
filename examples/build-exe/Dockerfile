# Copied from https://github.com/QSmally/Zig-Build/blob/master/Dockerfile
# 
FROM alpine AS compiler

ARG VERSION=0.14.0
ARG OPTIONS=-Doptimize=ReleaseSafe -Dtarget=x86_64-windows

RUN apk update && apk add curl tar xz

RUN curl https://ziglang.org/download/$VERSION/zig-linux-$(uname -m)-$VERSION.tar.xz -O && \
    tar -xf *.tar.xz && \
    mv zig-linux-$(uname -m)-$VERSION /compiler

WORKDIR /build
COPY . /build
RUN /compiler/zig build $OPTIONS

FROM scratch AS output
COPY --from=compiler /build/zig-out/bin /bin
