# syntax=docker/dockerfile:1.0.0-experimental
FROM alpine
RUN --mount=type=secret,id=test.key,required cp /run/secrets/test.key test.key
RUN --mount=type=secret,id=asdf.key,required cp /run/secrets/asdf.key asdf.key
ENTRYPOINT sh
