FROM dokken/ubuntu-18.04
WORKDIR /module4_task0
COPY . .
RUN apt-get update
RUN apt-get -y install nodejs npm
RUN ./setup.sh
RUN which go
RUN make build