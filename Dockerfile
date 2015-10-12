FROM node


RUN ls

RUN npm install -g gitbook-cli

RUN npm install
RUN gitbook build
RUN rm -rf node_modules

RUN ls ./_book

CMD rm -rf /book/* && cp -R ./_book/. /book