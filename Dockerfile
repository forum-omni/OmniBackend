FROM alpine:latest
RUN apk add --no-cache sqlite
WORKDIR /db/
COPY schema.sql /db/
CMD [ "sh", "-c", "sqlite3 omni.db < schema.sql"]