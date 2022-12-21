FROM echipdockerhub/baseworkspace:1.0
LABEL maintainer="Chi Cuong Le <chicuongle@protonmail.com>"
LABEL description="developement image for all projects with golang"

ARG user
ENV golang_version 1.19.4

RUN curl -o /tmp/golang_${golang_version}.tar.gz -L "https://go.dev/dl/go${golang_version}.linux-amd64.tar.gz" \
    && rm -rf /usr/local/go && tar -C /usr/local -xzf /tmp/golang_${golang_version}.tar.gz \
    && export PATH=$PATH:/usr/local/go/bin \
    && apt update \
    && apt install -y gcc
RUN mkdir -p /workspaces/GoLang/go \
    && chown -R $user:$user /workspaces
USER $user

RUN echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.bashrc\
    && echo "export GOPATH=/workspaces/GoLang/go" >> $HOME/.bashrc\
    && echo "export GOBIN=\$GOPATH/bin" >> $HOME/.bashrc \
    && echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.profile \
    && echo "export GOPATH=/workspaces/GoLang/go" >> $HOME/.profile\
    && echo "export GOBIN=\$GOPATH/bin" >> $HOME/.profile \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.zshrc\
    && echo "export GOPATH=/workspaces/GoLang/go" >> $HOME/.zshrc\
    && echo "export GOBIN=\$GOPATH/bin" >> $HOME/.zshrc 