# https://hub.docker.com/_/node?tab=tags
# Node.js ^12
FROM node:12-alpine3.12
MAINTAINER laszlo.kajan@roche.com
RUN apk update
RUN apk add --no-cache ca-certificates curl git jq make zip
RUN rm -rf /var/cache/apk/*

RUN curl -o /usr/local/share/ca-certificates/Roche_Root_CA_1_-_G2.crt http://certinfo.roche.com/rootcerts/Roche%20Root%20CA%201%20-%20G2.crt
RUN curl -o /usr/local/share/ca-certificates/Roche_G3_Root_CA.crt http://certinfo.roche.com/rootcerts/Roche%20G3%20Root%20CA.crt
RUN curl -o /usr/local/share/ca-certificates/Roche_G3_Issuing_CA_1.crt http://certinfo.roche.com/rootcerts/Roche%20G3%20Issuing%20CA%201.crt
RUN curl -o /usr/local/share/ca-certificates/Roche_G3_Issuing_CA_2.crt http://certinfo.roche.com/rootcerts/Roche%20G3%20Issuing%20CA%202.crt
RUN curl -o /usr/local/share/ca-certificates/Roche_G3_Issuing_CA_3.crt http://certinfo.roche.com/rootcerts/Roche%20G3%20Issuing%20CA%203.crt
RUN curl -o /usr/local/share/ca-certificates/Roche_G3_Issuing_CA_4.crt http://certinfo.roche.com/rootcerts/Roche%20G3%20Issuing%20CA%204.crt
RUN update-ca-certificates

RUN npm install -g --unsafe-perm=true mbt@1.0.16 @ui5/cli@2.6.2
