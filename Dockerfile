FROM node

RUN mkdir /gitbook
COPY ./* /gitbook/
WORKDIR /gitbook


RUN npm install -g gitbook-cli

RUN npm install
RUN gitbook build
RUN rm -rf node_modules

CMD rm -rf /book/* && cp -R /gitbook/_book/. /book