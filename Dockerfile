FROM tensorflow/tensorflow:1.13.1-py3-jupyter

LABEL maintainer="youremail@here.com"

COPY Container-Root /

RUN pip3 install --user --upgrade -r /requirements.txt

WORKDIR /

CMD ./startup.sh
