# docker build . -t crowd-counting2
# docker run -v ./results:/crowd-counting/results crowd-counting2
# docker run -v ./images:/crowd-counting/data/images/test -v ./results:/crowd-counting/results crowd-counting2
FROM tensorflow/tensorflow:2.7.2
COPY . /crowd-counting
WORKDIR /crowd-counting
RUN apt-get update && \
    apt-get install -y --no-install-recommends dialog apt-utils && \
    apt-get install -y \
    build-essential \
    curl \
    libopenmpi-dev \
    libgtk2.0-dev \    
    libsm6 \
    libxext6 \
    libxrender-dev \
    python3.5 \
    python3-pip \
    python3-tk \    
    python-dev \
    git 
RUN apt-get purge python-numpy
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3"]
CMD ["./main.py"]
