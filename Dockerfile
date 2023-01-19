FROM python:3.9-bullseye
#Installing latest version of vyper.
RUN pip install vyper

#Installing NodeJs
RUN apt-get update -y && apt install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
RUN apt install nodejs -y

#Installing Ganache
RUN npm install -g ganache-cli

#Installing Brownie
RUN pip install eth-brownie

#RUN brownie networks add development ganache-external cmd=ganache-cli host=http://ganache-cli-external accounts=10 mnemonic='minimum symptom minute gloom tragic situate silver mechanic salad amused elite beef' port=8545

WORKDIR /dapp

#Keeps docker running as a daemon container
ENTRYPOINT ["tail", "-f", "/dev/null"]