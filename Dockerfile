# Start by building the application.
FROM golang:1.11-alpine as build
RUN apk add --no-cache make bash

WORKDIR /go/src/github.com/terraform-providers/terraform-provider-mysql
COPY . .

RUN make build

# Now copy it into our base image.
FROM scratch
USER 1000
COPY --from=build /go/bin/terraform-provider-mysql /terraform-provider-mysql_v1.5.1