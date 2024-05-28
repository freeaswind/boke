FROM golang:1.18
ADD ./ /go/src/helloworld/
WORKDIR /go/src/helloworld
RUN go env -w GOPROXY=https://proxy.golang.com.cn,https://goproxy.cn,direct
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app .

FROM alpine:latest
ENV env1=env1value
ENV env2=env2value
MAINTAINER nick
WORKDIR /app/
COPY --from=0 /go/src/helloworld/app ./
EXPOSE 80
ENTRYPOINT ["./app"]
CMD ["--param1=p1","--param 2=p2"]