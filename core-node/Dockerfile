FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y nodejs npm git

WORKDIR /app
RUN git clone https://github.com/vergecurrency/bitcore.git bitcore

WORKDIR /app/bitcore
RUN cp package.json /tmp/package.json
RUN cd /tmp && npm install

RUN cp -a /tmp/node_modules /app/bitcore/
EXPOSE 3000

CMD ["npm", "run", "node"]