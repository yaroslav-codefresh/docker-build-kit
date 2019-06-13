# syntax=docker/dockerfile:1.0.0-experimental
FROM alpine

# install ssh client and git
RUN apk add --no-cache openssh-client git

# download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN --mount=type=secret,id=test.key,required cp /run/secrets/test.key test.key
RUN --mount=type=secret,id=asdf.key,required cp /run/secrets/asdf.key asdf.key
RUN --mount=type=ssh git clone git@github.com:yaroslav-codefresh/codefresh-sdk.git

ENTRYPOINT sh
