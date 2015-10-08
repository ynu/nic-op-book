FROM node

WORKDIR /srv/gitbook
COPY ./* /srv/gitbook/
RUN npm install
RUN npm install -g gitbook-cli
RUN npm install gitbook


EXPOSE 4000 35729

CMD gitbook serve .