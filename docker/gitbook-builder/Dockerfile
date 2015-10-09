FROM node

RUN npm install -g gitbook
RUN npm install
RUN gitbook build

CMD cd _book && ls