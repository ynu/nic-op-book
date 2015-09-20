FROM node

WORKDIR /srv/gitbook
COPY ./* /srv/gitbook/
RUN npm install
RUN npm install -g gitbook-cli && gitbook versions:install 2.3.0 && \
	apt-get clean autoclean && npm cache clear && \
	rm -rf /tmp/* /var/lib/{apt,dpkg,cache,log}/*



EXPOSE 4000 35729

CMD /usr/local/bin/gitbook serve