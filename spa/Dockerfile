FROM echipdockerhub/baseworkspace:1.1
LABEL maintainer="Chi Cuong Le <chicuongle@protonmail.com>"
LABEL description="developement image for all spa projects based on java and nodejs tech stack"

ARG user


RUN sudo sh -c "$(curl -fsSL https://deb.nodesource.com/setup_19.x)" \
    && sudo apt-get install -y nodejs \
    && sudo npm install --unsafe-perm -g @angular/cli@latest npm@latest gulp bower grunt grunt-cli yeoman-generator yo generator-angular generator-karma generator-webapp serve 

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && git clone https://github.com/gradle/gradle-completion ~/.oh-my-zsh/plugins/gradle-completion 

RUN curl -s "https://get.sdkman.io" | bash 
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk install java 19.0.2-open"

USER $user
COPY zshConf /home/$user/.zshrc



    