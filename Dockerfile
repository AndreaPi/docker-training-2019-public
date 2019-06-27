FROM tensorflow/tensorflow:1.13.1-py3-jupyter

LABEL maintainer="youremail@here.com"

COPY Container-Root /

RUN apt-get -y update -o Acquire::https::Verify-Peer=false && apt-get -y install \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    git

WORKDIR /

ENV PATH="${PATH}:/root/.local/bin"

RUN pip3 install --user --upgrade -r /requirements.txt

RUN git clone https://github.com/fizyr/keras-retinanet.git

RUN cd keras-retinanet && \
    pip3 install --user .

RUN pip3 install --user git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI

CMD ./startup.sh
