FROM alpine:latest
LABEL maintainer="Mislav Cimpersak"

RUN apk add --update bash curl jq py3-setuptools

RUN pip3 install awscli

RUN cd /usr/local/bin \
    && curl -k -sS -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl \
    && chmod 755 /usr/local/bin/kubectl

RUN cd /usr/local/bin \
    && curl -k -sS -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator \
    && chmod 755 /usr/local/bin/aws-iam-authenticator

CMD /bin/bash
