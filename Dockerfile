FROM debian:testing

# suppress debconf bleating about tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update; apt-get -y dist-upgrade
RUN apt-get -y install python3 python3-pip libpython3.5 libxft-dev libfreetype6-dev libpng-dev libfreetype6-dev curl wget apt-utils sudo zlib1g zlib1g-dev libedit2 libedit-dev locales

# install tini, zombie process reaper
RUN curl -L https://github.com/krallin/tini/releases/download/v0.9.0/tini_0.9.0.deb > /tmp/tini_0.9.0.deb
RUN dpkg -i /tmp/tini_0.9.0.deb
RUN apt-get install -y 

# add non-root container user
ENV NB_USER nlp
ENV NB_UID 1000
RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER

RUN pip3 install cython gensim sklearn pandas matplotlib nltk pyemd jupyter
RUN ipython3 kernel install
RUN python3 -m nltk.downloader punkt

# install and select fast BLAS, used by Numpy and others
RUN apt-get install -y libopenblas-base
RUN update-alternatives --set libblas.so.3 /usr/lib/openblas-base/libblas.so.3

USER $NB_USER

# working data area
RUN mkdir -p /home/$NB_USER/data
ENTRYPOINT ["tini", "--"]
CMD ["/usr/local/bin/jupyter-notebook", "--no-browser", "--ip=0.0.0.0", "--notebook-dir=/home/nlp/"]

EXPOSE 8888


