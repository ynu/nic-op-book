FROM tobegit3hub/gitbook-server

WORKDIR /gitbook
COPY ./* /gitbook/


EXPOSE 4000 35729

CMD ["gitbook", "serve", "/gitbook"]