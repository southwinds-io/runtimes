#
#  Artisan Application Runtime - Red Hat Universal Base Image minimal
#  ©2018-Present - SouthWinds Tech Ltd - www.southwinds.io
#  Licensed under the Apache License, Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0
#
#  Contributors to this project, hereby assign copyright in this code to the project,
#  to be licensed under the same terms as the rest of the code.
#
FROM registry.access.redhat.com/ubi8/ubi-minimal

ARG UNAME=runtime
ARG VERSION

ENV UID=1000
ENV GID=1000

LABEL io.southwinds.uri="www.southwinds.io"
LABEL io.southwinds.author="Southwinds Tech Ltd"
LABEL io.southwinds.maintainer="admin@southwinds.io"
LABEL io.southwinds.product="Artisan Application Runtime"
LABEL io.southwinds.version=$VERSION
LABEL io.southwinds.LICENSE="https://www.apache.org/licenses/LICENSE-2.0.html"

RUN microdnf install shadow-utils.x86_64 -y && \
    microdnf clean all && rm -rf /var/cache/yum && \
    groupadd -g $GID -o $UNAME && useradd -u $UID -g $GID $UNAME && \
    # required by artisan (local registry)
    mkdir -p /home/$UNAME/.artisan/locks && \
    mkdir -p /home/$UNAME/.artisan/tmp && \
    mkdir -p /home/$UNAME/.artisan/files && \
    chown -R $UNAME /home/$UNAME/.artisan && \
    # required by generic mounts
    mkdir -p /volume_0 && chown -R $UNAME /volume_0 && \
    mkdir -p /volume_1 && chown -R $UNAME /volume_1 && \
    mkdir -p /volume_2 && chown -R $UNAME /volume_2

WORKDIR /app/

COPY art /usr/bin/
COPY boot.sh /app/

RUN chmod u+x /usr/bin/art && chown -R $UNAME /app && chmod u+x /app/boot.sh

VOLUME /volume_0 /volume_1 /volume_2

USER $UNAME

CMD ["sh", "-c", "/app/boot.sh"]

EXPOSE 8080/tcp