FROM alpine

LABEL version="1.0.0"
LABEL name="kubectl"
LABEL repository="http://github.com/tinybeans/kubectl-action"

LABEL maintainer="tinybeans <tech@tinybeans.com >"
LABEL com.github.actions.name="kubectl action"
LABEL com.github.actions.description="Runs kubectl, config can be provided with secret KUBE_CONFIG_DATA."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="blue"

ENV AWS_CLI_VER=2.0.30
ENV IAM_AUTH_VER=1.21.2/2021-07-05

RUN apk update && apk add --no-cache curl gcompat zip &&  \
    curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/${IAM_AUTH_VER}/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x /usr/local/bin/aws-iam-authenticator && \
    curl -s https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VER}.zip -o awscliv2.zip && \
    unzip awscliv2.zip && ./aws/install && rm awscliv2.zip

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
