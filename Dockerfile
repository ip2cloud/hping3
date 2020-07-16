FROM alpine:latest

MAINTAINER Alfredo Sabocinski Neto <alfredo@ip2.cloud>
LABEL desription="Teste hping3 imagem Alpine:latest"
LABEL version="1.0"

RUN wget http://www.hping.org/hping3-20051105.tar.gz && \
  tar -xvzf hping3-20051105.tar.gz && \
  cd hping3-20051105 && \
  sed -i '12i \\t|| defined(__x86_64__) \\' bytesex.h && \
  apk add gcc gcc-objc make libpcap-dev tcl-dev && \
  ln -s /usr/include/pcap-bpf.h /usr/include/net/bpf.h && \
  ./configure && make && make install && \
  rm -rf ../hping3*

ENTRYPOINT ["hping3"]