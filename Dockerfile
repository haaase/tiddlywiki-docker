FROM node:alpine

ENV SERVER_OPTIONS="port=8080 host=0.0.0.0"
ENV WIKI_NAME="mywiki"

RUN npm install -g tiddlywiki

# Setup wiki volume
VOLUME /var/lib/tiddlywiki
WORKDIR /var/lib/tiddlywiki

# Add init-and-run script
ADD tiddlyweb_host /tiddlyweb_host_template
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki

# Meta
ENTRYPOINT ["/usr/local/bin/init-and-run-wiki"]
EXPOSE 8080
