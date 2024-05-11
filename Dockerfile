# Build the Vue app
FROM node:20 as build-stage
WORKDIR /app
COPY package*.json ./

RUN npm install
COPY ./ .
RUN npm run build

# Put the built app in a serving
FROM moreillon/vue-serving as production-stage
COPY --from=build-stage /app/dist /usr/src/app/dist

# Custom stuff
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
