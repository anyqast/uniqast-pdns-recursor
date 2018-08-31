FROM alpine:edge
RUN apk upgrade --no-cache \
 && apk add --no-cache pdns-recursor supervisor bash bind-tools telegraf
ADD files /
ENV HEALTHCHECK_IP_RANGE_START=127.0.0.1 \
    HEALTHCHECK_IP_RANGE_END=127.255.255.254 \
    TELEGRAF_AGENT_COLLECT_INTERVAL=1s \
    TELEGRAF_AGENT_FLUSH_INTERVAL=1s \
    TELEGRAF_OUTPUTS= \
    ALLOW_FROM=0.0.0.0/0,::/0 \
    ANY_TO_TCP=yes \
    CLIENT_TCP_TIMEOUT=2 \
    DAEMON=no \
    DISABLE_PACKETCACHE=no \
    DISABLE_SYSLOG=yes \
    DNSSEC=process-no-validate \
    DNSSEC_LOG_BOGUS=no \
    DONT_QUERY=0.0.0.0/8,10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/3,::/128,::1/128,fc00::/7,fe80::/10,::/96,::ffff:0:0/96,100::/64,2001:db8::/32,ff00::/8 \
    EDNS_OUTGOING_BUFSIZE=1680 \
    EDNS_SUBNET_WHITELIST=255.255.255.255/32 \
    ENTROPY_SOURCE=/dev/urandom \
    ETC_HOSTS_FILE=/dev/null \
    EXPORT_ETC_HOSTS=no \
    HINT_FILE=/etc/pdns/opennic.hint \
    LATENCY_STATISTIC_SIZE=10000 \
    LOCAL_ADDRESS=0.0.0.0,:: \
    LOCAL_PORT=53 \
    NON_LOCAL_BIND=yes \
    LOGLEVEL=6 \
    LOG_COMMON_ERRORS=yes \
    LOWERCASE_OUTGOING=no \
    MAX_CACHE_ENTRIES=32768 \
    MAX_CACHE_TTL=604800 \
    MAX_MTHREADS=2048 \
    MAX_PACKETCACHE_ENTRIES=32768 \
    MAX_QPERQ=50 \
    MAX_NEGATIVE_TTL=900 \
    MAX_RECURSION_DEPTH=40 \
    MAX_TCP_CLIENTS=1024 \
    MAX_TCP_PER_CLIENT=64 \
    MAX_TOTAL_MSEC=15000 \
    MINIMUM_TTL_OVERRIDE=30 \
    NETWORK_TIMEOUT=1000 \
    PACKETCACHE_TTL=3600 \
    PACKETCACHE_SERVFAIL_TTL=60 \
    PDNS_DISTRIBUTES_QUERIES=no \
    QUERY_LOCAL_ADDRESS=0.0.0.0 \
    QUERY_LOCAL_ADDRESS6=:: \
    QUIET=yes \
    REUSEPORT=yes \
    ROOT_NX_TRUST=yes \
    SECURITY_POLL_SUFFIX= \
    SERVE_RFC1918=yes \
    SERVER_DOWN_MAX_FAILS=16 \
    SERVER_DOWN_THROTTLE_TIME=60 \
    SETGID=recursor \
    SETUID=recursor \
    SINGLE_SOCKET=no \
    SPOOF_NEARMISS_MAX=10 \
    STACK_SIZE=200000 \
    STATS_RINGBUFFER_ENTRIES=10000 \
    THREADS=8 \
    TRACE=no \
    UDP_TRUNCATION_THRESHOLD=512 \
    USE_INCOMING_EDNS_SUBNET=no
CMD ["/boot.sh"]
HEALTHCHECK --interval=5s --timeout=15s --start-period=300s --retries=6 CMD /healthcheck.sh
