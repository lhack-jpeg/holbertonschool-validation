FROM golang:1.15.8-alpine
WORKDIR /module4_task2
COPY . .
RUN apk update
RUN apk add zip=3.0-r9 yamllint=1.23.0-r0 shellcheck=0.7.1-r2 curl=7.79.1-r3 \
    hugo=0.79.1-r0 make=4.3-r0 nodejs=14.20.1-r0 nodejs-npm=14.20.1-r0 --no-cache \
    && rm -rf /var/cache/apk/*
# hadolint ignore=DL4006
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin v1.50.1"
ENV NODE_VERSION=16.13.0
# Install dependencies and delete lists
RUN curl -L --create-dirs --output /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
    && chmod a+x /usr/local/bin/yq
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
# ENV NVM_DIR=/root/.nvm
# RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
# RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
# RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
# ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN npm install -g markdownlint-cli@latest