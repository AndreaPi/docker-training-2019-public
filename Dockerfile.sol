FROM tensorflow/tensorflow:1.13.1-py3-jupyter

LABEL maintainer="youremail@here.com"

ARG http_proxy
ARG https_proxy
ARG no_proxy

COPY Container-Root /

RUN export http_proxy=$http_proxy; export https_proxy=$https_proxy; export no_proxy=$no_proxy; /setup.sh; rm -f /setup.sh

RUN pip3 install --user --upgrade -r /requirements.txt

WORKDIR /

CMD ./startup.sh
