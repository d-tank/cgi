FROM dtank/core:latest

MAINTAINER benharker@mac.com

RUN wget -O - http://ppa.moosefs.com/moosefs.key | apt-key add - && echo "deb http://ppa.moosefs.com/current/apt/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/moosefs.list ;
RUN apt-get update ; apt-get install -y moosefs-cgi moosefs-cgiserv nano ; rm -rf /var/lib/apt/lists/* ;
#&& mv /etc/mfs/mfscgi.cfg.sample /etc/mfs/mfscgi.cfg ; 

EXPOSE 9425

COPY ./run-cgi /usr/local/bin/run-cgi
RUN chmod -Rv 777 /usr/local/bin/* ; 

CMD ["/usr/local/bin/run-cgi"]
