FROM node

RUN npm install -g gitbook-cli
RUN npm install
RUN gitbook build

WORKDIR /book
RUN cp -R ./_book/. /book

CMD cd _book && ls