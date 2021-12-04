FROM golang:1.17.1-alpine AS build

RUN groupadd -r demo-app && useradd -r -g demo-app demo-app
USER demo-app

WORKDIR /src/
COPY main.go go.* /src/

RUN CGO_ENABLED=0 go build -o /bin/demo-app

FROM scratch
COPY --from=build /bin/demo-app /bin/demo-app
ENTRYPOINT ["/bin/demo-app"]