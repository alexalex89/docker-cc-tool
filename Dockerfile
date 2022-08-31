FROM ubuntu

RUN apt update && apt install -y curl build-essential gcc pkg-config libusb-1.0-0-dev sdcc libboost-all-dev && cd / && curl -L -o cc-tool.tgz "https://downloads.sourceforge.net/project/cctool/cc-tool-0.26-src.tgz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcctool%2Ffiles%2F&amp;ts=1564933129&amp;use_mirror=netcologne" && tar zxvf cc-tool.tgz && cd cc-tool && rm -rf /var/lib/apt/lists/* && sed -i -e 's/`cat conftest.i`/'"\"$(dpkg -l | grep libboost-all-dev | cut -d " " -f26 | sed 's/ubuntu1//g' | sed 's/\./_/g')\"/g" configure && ./configure && make && make install

ENTRYPOINT ["/cc-tool/cc-tool", "-e", "-w", "/input"]
