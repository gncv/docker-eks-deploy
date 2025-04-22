FROM alpine:latest
LABEL maintainer="Mislav Cimpersak"

RUN apk add --update bash curl jq python3 python3-dev py3-pip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws/

RUN cd /usr/local/bin \
    && curl -k -sS -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.32.0/2024-12-20/bin/linux/amd64/kubectl \
    && chmod 755 /usr/local/bin/kubectl

RUN curl -L https://get.helm.sh/helm-v3.17.3-linux-amd64.tar.gz | tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64

RUN cd /usr/local/bin \
    && curl -k -sS -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/aws-iam-authenticator \
    && chmod 755 /usr/local/bin/aws-iam-authenticator

CMD ["/bin/bash"]
