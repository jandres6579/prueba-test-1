FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install python python-pip -y
RUN mkdir /opt/app_jenkins_test
COPY ./src/main.py /opt/app_jenkins_test/
COPY ./src/requirements.txt /opt/app_jenkins_test/
RUN pip install -r /opt/app_jenkins_test/requirements.txt

COPY docker-entrypoint.sh /

ENTRYPOINT "/docker-entrypoint.sh"
