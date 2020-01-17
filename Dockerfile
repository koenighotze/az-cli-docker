FROM mcr.microsoft.com/azure-cli:2.0.80

WORKDIR /home/azscripts

ARG DEFAULT_ORGANISATION
ARG DEFAULT_PROJECT

ARG NAME=n/a
ARG CREATED=n/a
ARG TITLE=n/a
ARG SOURCE=n/a
ARG REVISION=n/a
ARG BUILD_URL=n/a

LABEL org.opencontainers.image.authors="David Schmitz / @Koenighotze"
LABEL org.opencontainers.image.name="${NAME}"
LABEL org.opencontainers.image.created="${CREATED}"
LABEL org.opencontainers.image.title="${TITLE}"
LABEL org.opencontainers.image.source="${SOURCE}"
LABEL org.opencontainers.image.revision="${REVISION}"
LABEL org.opencontainers.image.build_url="${BUILD_URL}"

RUN az extension add --name azure-devops \
  && az extension add --name find \
  && az extension add --name webapp \
  && az extension add --name alias

COPY banner.txt ./
COPY az.sh ./

ENV HOME=/home/az

WORKDIR /home/az
ENTRYPOINT [ "/home/azscripts/az.sh" ]
CMD [ "--help" ]

