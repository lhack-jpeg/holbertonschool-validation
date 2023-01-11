FROM golang:1.15.8-buster
WORKDIR /module4_task0
COPY . .
RUN apt-get -y install nodejs npm
RUN ./setup.sh
RUN which go
RUN make build