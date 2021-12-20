FROM golang:1.17.1-alpine AS build

WORKDIR /src/
COPY main.go go.* /src/

RUN CGO_ENABLED=0 go build -o /bin/demo-app

FROM ubuntu
RUN apt-get update && apt-get install -y curl arp-scan
COPY --from=build /bin/demo-app /bin/demo-app

ENTRYPOINT ["/bin/demo-app"]