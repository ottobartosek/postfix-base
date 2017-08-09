FROM ubuntu:16.04

LABEL maintainer="bartosek@dynatech.cz" \
      company="DYNATECH s.r.o."

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends postfix ca-certificates rsyslog tzdata logrotate && \
    rm -rf /var/lib/apt/lists/*

COPY ./scripts/* /etc/postfix/scripts/

EXPOSE 25/tcp

CMD ["/etc/postfix/scripts/postfix_cmd.sh"]
