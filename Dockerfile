
# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM daocloud.io/python:3.6

# If you prefer miniconda:
#FROM continuumio/miniconda3

LABEL Name=sspanel Version=0.0.1
EXPOSE 8080
WORKDIR /src/django-sspanel
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y cron && rm -rf /var/lib/apt/lists/*

ADD requirements.txt requirements.txt
# Using pip:
RUN pip install --upgrade pip  -i https://pypi.tuna.tsinghua.edu.cn/simple;pip install -r requirements.txt  -i https://pypi.tuna.tsinghua.edu.cn/simple
ADD . .
CMD ["bash","./start.sh"]