FROM node

RUN mkdir /gitbook
ADD * /gitbook/
WORKDIR /gitbook

RUN ls

RUN npm install -g gitbook-cli

RUN npm install
RUN gitbook build
RUN rm -rf node_modules

RUN ls /gitbook/_book

CMD rm -rf /book/* && cp -R /gitbook/_book/. /book