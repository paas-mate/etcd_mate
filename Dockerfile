FROM ttbb/base:go AS build
COPY . /opt/sh/compile
WORKDIR /opt/sh/compile/pkg
RUN go build -o etcd_mate .


FROM ttbb/etcd:nake

COPY docker-build /opt/sh/etcd/mate

COPY --from=build /opt/sh/compile/pkg/etcd_mate /opt/sh/etcd/mate/etcd_mate

WORKDIR /opt/sh/etcd

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/sh/etcd/mate/scripts/start.sh"]
