FROM echipdockerhub/baseworkspace:1.0
LABEL maintainer="Chi Cuong Le <chicuongle@protonmail.com>"
LABEL description="developement image for all projects with golang"

ARG user
ENV golang_version 1.21.6

RUN curl -o /tmp/golang_${golang_version}.tar.gz -L "https://go.dev/dl/go${golang_version}.linux-amd64.tar.gz" \
    && rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/golang_${golang_version}.tar.gz \
    && export PATH=$PATH:/usr/local/go/bin \
    && apt update \
    && apt install -y gcc
RUN mkdir -p /GoLang \
    && chown -R $user:$user /GoLang


USER $user
RUN echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.bashrc\
    && echo "export GOPATH=/GoLang" >> $HOME/.bashrc\
    && echo "export GOBIN=\$GOPATH/bin" >> $HOME/.bashrc \
    && echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.profile \
    && echo "export GOPATH=/GoLang" >> $HOME/.profile\
    && echo "export GOBIN=\$GOPATH/bin" >> $HOME/.profile \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.zshrc\
    && echo "export GOPATH=/GoLang" >> $HOME/.zshrc\
    && echo "export GOBIN=\$GOPATH/bin" >> $HOME/.zshrc 

RUN export PATH=$PATH:/usr/local/go/bin \
    && export GOPATH=/GoLang \
    && export GOBIN=$GOPATH/bin \
    && go install 'github.com/fatih/gomodifytags@v1.16.0' \
    && go install 'github.com/haya14busa/goplay/cmd/goplay@v1.0.0' \
    && go install 'github.com/josharian/impl@v1.1.0' \
    && go install 'mvdan.cc/gofumpt@v0.5.0' \
    && go install 'golang.org/x/tools/cmd/goimports@latest' \
    && go install 'github.com/cweill/gotests/gotests@v1.6.0' \
    && go install 'golang.org/x/lint/golint@latest' \
    && go install 'honnef.co/go/tools/cmd/staticcheck@latest'  \
    && go install 'github.com/golangci/golangci-lint/cmd/golangci-lint@latest' \
    && go install 'github.com/mgechev/revive@latest' \
    && go install 'golang.org/x/tools/gopls@v0.14.2' \
    && go install 'github.com/go-delve/delve/cmd/dlv@v1.8.3' \
    && go install 'github.com/golang/vscode-go/vscgo@latest' 