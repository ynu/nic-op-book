FROM node

RUN npm install -g gitbook-cli
RUN npm install
RUN gitbook build
RUN ls ./_book

WORKDIR /book
RUN cp -R ./_book/. /book

CMD ls