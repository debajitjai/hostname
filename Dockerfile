# Simple container to print server ip and port, host name and build version
FROM nginx:latest
#ARG & ENV combined to pass arrgument during build time
# must use "docker build --build-arg VERSION=<X.X> -t hostname:<X.X> ."
ARG VERSION=v0
ENV VERSION=$VERSION

COPY index.html /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/

#RUN in shell mode to use double quote so that $VERSION can be passed on sed (one of the quirks of bash!)
RUN /bin/bash -c 'sed -i "s/VERSION/$VERSION/" /usr/share/nginx/html/index.html'

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
