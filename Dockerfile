FROM ubuntu:bionic

WORKDIR /app

RUN apt-get update
RUN apt-get install python3.6 python3.6-dev python3.6-distutils python3.6-venv -y
RUN apt-get install git -y
RUN apt-get install wget -y
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN pip3 install opencv-python
RUN pip3 install opencv-contrib-python
RUN pip3 install h5py
RUN pip3 install tensorflow==1.4.0
RUN pip3 install scipy==1.1.0
RUN pip3 install trimesh==2.37.1
RUN apt-get install libspatialindex-dev -y
RUN pip3 install rtree==0.9.3
RUN apt install libgl1-mesa-glx -y
RUN apt-get --reinstall install libqt5dbus5 \
libqt5widgets5 libqt5network5 libqt5gui5 libqt5core5a \
libdouble-conversion1 libxcb-xinerama0 -y
RUN pip3 install psutil
RUN git clone https://github.com/Shynixn/PaintingLight.git && echo "Hell"


COPY ["resources", "./PaintingLight/code"]

CMD ["sh", "-c", "cd /app/PaintingLight/code && python3.6 default.py emilia.jpg 50 90 && tail -f /dev/null"]