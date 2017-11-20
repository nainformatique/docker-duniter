FROM debian:latest
MAINTAINER nain formatique <nainformatique@gresille.org>

RUN apt update
RUN apt install -y curl wget unzip

RUN v=`curl -Ls -o /dev/null -w %{url_effective} https://github.com/duniter/duniter/releases/latest | rev | cut -d '/' -f 1 | rev` && wget https://github.com/duniter/duniter/releases/download/$v/duniter-server-$v-linux-x64.deb && dpkg -i duniter-server-$v-linux-x64.deb

RUN apt upgrade -y

RUN mkdir -p /keys

CMD duniter direct_start --nointeractive --keyfile /keys/keyfile