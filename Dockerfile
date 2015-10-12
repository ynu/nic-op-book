FROM node

ADD gzlc/* /gitbook/gzlc/
ADD hr/* /gitbook/hr/
ADD kb/* /gitbook/kb/
ADD Gruntfile.js /gitbook/
ADD package.json /gitbook/
ADD README.md /gitbook/
ADD SUMMARY.md /gitbook/
ADD zongze.md /gitbook/

WORKDIR /gitbook

RUN ls

RUN npm install -g gitbook-cli

RUN npm install
RUN gitbook build
RUN rm -rf node_modules

RUN ls /gitbook/_book
RUN ls /gitbook/_book/gzlc
RUN ls /gitbook/_book/gzlc/xiaowei

CMD rm -rf /book/* && cp -R /gitbook/_book/. /book