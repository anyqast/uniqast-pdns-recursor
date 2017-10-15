FROM alpine:edge
RUN apk upgrade --no-cache \
 && apk add --no-cache pdns-recursor supervisor bash bind-tools
ADD files /
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
HEALTHCHECK --interval=5s --timeout=15s --start-period=300s --retries=6 CMD /healthcheck.sh
