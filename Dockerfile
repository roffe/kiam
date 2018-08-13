FROM golang:1.10-alpine3.8 as build
RUN apk add --no-cache make
WORKDIR /go/src/github.com/uswitch/kiam
ADD . .
RUN make proto/service.pb.go build-linux

FROM alpine:3.8
RUN apk --no-cache add iptables
COPY --from=build /go/src/github.com/uswitch/kiam/bin/kiam-linux-amd64 /kiam
CMD []
