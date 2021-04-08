FROM registry.opensuse.org/opensuse/leap:15.2

# Setup NodeJS
RUN zypper ref && zypper --non-interactive in nodejs14
RUN zypper --non-interactive in npm14
WORKDIR /usr/src/kingdom
COPY package*.json ./
RUN npm install

# Setup Kingdom
COPY . .

# Api
EXPOSE 9864
ENTRYPOINT ["node","server.js"]