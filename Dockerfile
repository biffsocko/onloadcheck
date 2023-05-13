FROM ubuntu:latest
COPY onloadchk.sh /onloadchk.sh
COPY onload_list  /onload_list
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN apt-get update && apt-get install -y \
    python3 \
    openssh-client \
    git \
    curl \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN echo "StrictHostKeyChecking no" >> /root/.ssh/config
RUN git clone git@github.com:biffsocko/pssh3.git
CMD /onloadchk.sh

