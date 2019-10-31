FROM tensorflow/tensorflow:1.15.0-py3-jupyter

LABEL maintainer="youremail@here.com"

RUN apt-get -y update -o Acquire::https::Verify-Peer=false \ 
    && apt-get -y install --no-install-recommends \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /

ENV PATH="${PATH}:/root/.local/bin"

COPY requirements.txt /

RUN pip3 install --user --upgrade -r /requirements.txt

RUN git clone https://github.com/fizyr/keras-retinanet.git

RUN cd keras-retinanet && \
    pip3 install --user .

RUN pip3 install --user git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI

COPY Container-Root /

CMD ./startup.sh
