FROM alpine

LABEL version="1.0.0"
LABEL name="kubectl"
LABEL repository="http://github.com/tinybeans/kubectl-action"

LABEL maintainer="tinybeans <tech@tinybeans.com >"
LABEL com.github.actions.name="kubectl action"
LABEL com.github.actions.description="Runs kubectl, config can be provided with secret KUBE_CONFIG_DATA."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="blue"

RUN apk add --no-cache curl

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
