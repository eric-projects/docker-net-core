FROM scratch
ADD alpine-minirootfs-3.10.2-x86_64.tar.gz /
ADD aspnetcore-runtime-3.0.0-linux-musl-x64.tar.gz /netcore
ADD publish /publish
RUN ln -s /netcore/dotnet /usr/local/bin
RUN apk update
RUN apk add  libstdc++
RUN apk add  openssl
# RUN apk add --no-cache icu-libs
RUN apk add icu-libs
RUN apk add  libintl
CMD ["/bin/sh"]