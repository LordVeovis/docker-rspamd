FROM alpine:3.14

RUN set -xe; \
	apk add rspamd \
		rspamd-proxy; \
	install -d -o rspamd -g rspamd -m 755 /run/rspamd

VOLUME /etc/rspamd/local.d
USER rspamd
CMD ["/usr/sbin/rspamd","-f","-c","/etc/rspamd/rspamd.conf","-p","/run/rspamd/rspamd.pid"]
