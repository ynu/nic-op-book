FROM node

RUN mkdir /gitbook
ADD * /gitbook/
ADD gzlc/* /gitbook/gzlc/
ADD hr/* /gitbook/hr/
ADD kb/* /gitbook/kb/
ADD Gruntfile.js
ADD package.json
ADD README.md
ADD SUMMARY.md
ADD zongze.md

WORKDIR /gitbook

RUN ls

RUN npm install -g gitbook-cli

RUN npm install
RUN gitbook build
RUN rm -rf node_modules

RUN ls /gitbook/_book
RUN ls /gitbook/_book/gzlc

CMD rm -rf /book/* && cp -R /gitbook/_book/. /book