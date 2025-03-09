FROM debian:12-slim

WORKDIR /app

COPY app/ /app/
COPY entrypoint.sh /app/

RUN apt update && apt install -y libglib2.0-0 libunwind8 && chmod +x /app/mappersrv /app/entrypoint.sh

EXPOSE 12000

WORKDIR /app

ENV ULTIMA_MAPPER_NAME=UltimaMapper
ENV ULTIMA_MAPPER_PASSWORD=test
ENV ULTIMA_MAPPER_ADMIN_NAME=admin

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["./mappersrv"]
