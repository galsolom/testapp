FROM alpine:latest

WORKDIR /app

COPY . .

RUN ls

CMD ["echo","hello from alpine!"]