#
#  Artisan Enterprise Application Runtime - Red Hat Universal Base Image minimal
#  ©2018-Present - SouthWinds Tech Ltd - www.southwinds.io
#  Licensed under the Apache License, Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0
#
#  Contributors to this project, hereby assign copyright in this code to the project,
#  to be licensed under the same terms as the rest of the code.
#
FROM registry.access.redhat.com/ubi8/ubi-minimal

ARG UNAME=artisan
ARG VERSION
ARG TIME

ENV UID=555
ENV GID=555

LABEL io.southwinds.uri="www.southwinds.io"
LABEL io.southwinds.author="Southwinds Tech Ltd"
LABEL io.southwinds.maintainer="admin@southwinds.io"
LABEL io.southwinds.product="Artisan Enterprise Application Runtime"
LABEL io.southwinds.LICENSE="SouthWinds Tech Ltd EULA"
LABEL io.southwinds.build.version=$VERSION
LABEL io.southwinds.build.time=$TIME

RUN microdnf install shadow-utils.x86_64 -y && \
    microdnf clean all && rm -rf /var/cache/yum && \
    groupadd -r -g 555 $UNAME && \
    useradd -r -m -d /opt/$UNAME -u $UID -g $GID $UNAME -s /bin/bash && \
    # required by artisan (local registry)
    mkdir -p /opt/$UNAME/.artisan/locks && \
    mkdir -p /opt/$UNAME/.artisan/tmp && \
    mkdir -p /opt/$UNAME/.artisan/files && \
    chown -R $UNAME /opt/$UNAME/.artisan && \
    # required by generic mounts
    mkdir -p /volume_0 && chown -R $UNAME /volume_0 && \
    mkdir -p /volume_1 && chown -R $UNAME /volume_1 && \
    mkdir -p /volume_2 && chown -R $UNAME /volume_2 && \
    # required to mount id store
    mkdir -p /.art && chown -R $UNAME /.art

WORKDIR /app/

COPY art /usr/bin/
COPY boot.sh /app/

RUN chmod u+x /usr/bin/art && chown -R $UNAME /app && chmod u+x /app/boot.sh

VOLUME /volume_0 /volume_1 /volume_2

USER $UNAME

CMD ["sh", "-c", "/app/boot.sh"]

EXPOSE 8080/tcp