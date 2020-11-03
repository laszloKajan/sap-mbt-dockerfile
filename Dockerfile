# https://hub.docker.com/_/node?tab=tags
# node:lts-alpine = sha256:5a940b79d5655cc688cfb319bd4d0f18565bc732ae19fab6106daaa72aeb7a63
FROM node@sha256:5a940b79d5655cc688cfb319bd4d0f18565bc732ae19fab6106daaa72aeb7a63
MAINTAINER laszlo.kajan@roche.com
#RUN apk update
RUN apk add ca-certificates curl git jq zip
RUN rm -rf /var/cache/apk/*

RUN curl -o /usr/local/share/ca-certificates/Roche_Root_CA_1_-_G2.crt http://certinfo.roche.com/rootcerts/Roche%20Root%20CA%201%20-%20G2.crt
RUN update-ca-certificates

RUN npm install -g --unsafe-perm=true mbt
# Match to dependencies of
#	https://code.roche.com/sap-aspire/scp/supporting-projects/devops-fb-assign-transport-request/-/blob/master/package.json
RUN npm install "axios@0.21.0" "command-line-args@5.1.1" "command-line-usage@6.1.0" "puppeteer@5.4.1"
#RUN npm install "@sap-aspire/assign-transport-request"
