#!/bin/sh

if [ ! -e $APP_HOME/conf ];
then
	echo "first run: starting configure"
	cp -rp /opt/upsource/conftemplate $APP_HOME/conf
	ln -s $APP_HOME/conf /opt/upsource/conf
	bin/upsource.sh configure \
		--backups-dir $APP_HOME/backups \
		--data-dir    $APP_HOME/data \
		--logs-dir    $APP_HOME/log \
		--temp-dir    $APP_HOME/tmp \
		--listen-port 8080 \
		--base-url    http://$BASE_URL/
else
	rm -rf /opt/upsource/conf
	ln -s $APP_HOME/conf /opt/upsource/conf
fi

bin/upsource.sh run
