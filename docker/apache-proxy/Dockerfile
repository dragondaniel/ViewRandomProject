FROM httpd:2.4
ENV UNSET_HTTP_HEADER=Content-Type
ENV SET_HTTP_HEADER=ID:Hello,ID2:test
COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./my-index.html /usr/local/apache2/htdocs/index.html
COPY ./my-test-cgi /usr/local/apache2/cgi-bin/test-cgi
#tried both Header unset and RequestHeader unset- not working as expected
RUN echo "RequestHeader unset" $UNSET_HTTP_HEADER >> /usr/local/apache2/conf/httpd.conf
RUN for i in $(echo $SET_HTTP_HEADER | sed "s/,/ /g");do echo "Header append" `echo $i| awk -F ":" '{print $1}'` "\"" `echo $i| awk -F ":" '{print $2}'` "\"" >> /usr/local/apache2/conf/httpd.conf;done

EXPOSE 80
