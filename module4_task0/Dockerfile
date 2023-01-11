FROM dokken/ubuntu-18.04
WORKDIR /module4_task0
COPY . .
RUN ./setup.sh
RUN apt-get update
RUN apt-get -y install \
    npm \
    node
RUN which go
RUN make build