FROM golang:1.17.1-alpine AS build

WORKDIR /src/
COPY main.go go.* /src/

RUN CGO_ENABLED=0 go build -o /bin/demo-app

FROM alpine
RUN apk add curl
COPY --from=build /bin/demo-app /bin/demo-app

RUN addgroup demo-app \
  && adduser -D -G demo-app demo-app \
  && chown -R demo-app:demo-app /bin/demo-app
USER demo-app

ENTRYPOINT ["/bin/demo-app"]