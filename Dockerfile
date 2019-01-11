# Ref. http://blog.naver.com/PostView.nhn?blogId=wideeyed&logNo=221325855272&categoryNo=58&parentCategoryNo=0&viewDate=&currentPage=1&postListTopCurrentPage=1&from=postView&userTopListOpen=true&userTopListCount=10&userTopListManageOpen=false&userTopListCurrentPage=1
# Ref. https://github.com/keras-team/keras/blob/master/docker/Dockerfile

FROM ubuntu:latest
MAINTAINER lian, kirseia@gmail.com

# Start time
RUN echo '================start================'

ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

# wget 설치
RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    g++ \
    git \
    graphviz \
    libgl1-mesa-glx \
    libhdf5-dev \
    openmpi-bin \
    wget && \
    rm -rf /var/lib/apt/lists/*

# anaconda3 wget 으로 받아서 실행
RUN wget --quiet --no-check-certificate https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh && \
 /bin/bash Anaconda3-2018.12-Linux-x86_64.sh -f -b -p /opt/conda && \
 rm Anaconda3-2018.12-Linux-x86_64.sh && \
 echo export PATH=$CONDA_DIR/bin:'$PATH' > /etc/profile.d/conda.sh

ARG python_version=3.6

# CPU 버전 설치, mac은 radeon 이라... GPU 버전은 keras-gpu 로 설치
RUN conda install python=${python_version} && conda install -y keras

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# ENV PYTHONPATH='/notebooks/:$PYTHONPATH'

WORKDIR /notebooks  # 소스 코드 위치로 이동

EXPOSE 8888

RUN python -c "import tensorflow; print(tensorflow.__version__); import keras; print(keras.__version__);"

CMD jupyter notebook --allow-root --port=8888 --ip=0.0.0.0 --notebook-dir=/notebooks

RUN echo '================end================'
