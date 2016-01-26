FROM java:latest

MAINTAINER Seti <seti@setadesign.net>

ENV APP_VERSION 2.5
ENV APP_BUILD $APP_VERSION.5047
ENV APP_HOME /data

RUN curl -L https://download.jetbrains.com/upsource/upsource-$APP_BUILD.zip -o /opt/upsource.zip && \
	cd /opt/ && \
	unzip /opt/upsource.zip && \
	mv Upsource upsource && \
	rm -f /opt/upsource.zip && \
	mkdir $APP_HOME && \
	groupadd -r upsource && \
	useradd -r -g upsource -u 1000 -d $APP_HOME upsource && \
	chown -R upsource:upsource $APP_HOME /opt/upsource

WORKDIR /opt/upsource
ADD run.sh /opt/upsource/
RUN chmod o+rx run.sh
USER upsource
ENTRYPOINT ["/opt/upsource/run.sh"]
EXPOSE 8080
VOLUME ["$APP_HOME"]
