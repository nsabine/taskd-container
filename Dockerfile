FROM fedora
MAINTAINER nick@nicksabine.com

RUN dnf -y install taskd gnutls-utils which hostname && dnf clean all

ENV TASKDDATA /task_data
VOLUME ["/task_data"]

EXPOSE 53589

ADD ./start-taskd.sh /start-taskd.sh

CMD /start-taskd.sh

