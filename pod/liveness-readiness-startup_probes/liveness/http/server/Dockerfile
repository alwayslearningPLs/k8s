FROM golang:alpine AS base

COPY ./src /github.com/MrTimeout/server-crash-after-n-seconds
WORKDIR /github.com/MrTimeout/server-crash-after-n-seconds

RUN mkdir bin && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./bin/server-crash-after-n-seconds ./...

FROM scratch

ENV CRASH_AFTER 30
ENV PORT 8080

COPY --from=base /github.com/MrTimeout/server-crash-after-n-seconds/bin/server-crash-after-n-seconds /server

CMD ["/server"]