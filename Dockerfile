FROM alpine:3.10.2

# install ca-certificates so that HTTPS works consistently
RUN apk add --no-cache ca-certificates

RUN apk add --no-cache --update \
      git \
      bash \
      nodejs \
      npm \
      aria2

RUN npm config set unsafe-perm true
COPY . .
RUN npm install
RUN npm run build
RUN npm start
      
