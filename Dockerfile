FROM gotenberg/gotenberg:8-aws-lambda

USER root

COPY ./fonts/* /usr/local/share/fonts/

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
      locales \
      libreoffice-l10n-fr \
 && sed -i '/fr_FR.UTF-8/s/^# //g' /etc/locale.gen \
 && locale-gen \
 && fc-cache -f -v \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=fr_FR.UTF-8 \
    LANGUAGE=fr_FR:fr \
    LC_ALL=fr_FR.UTF-8

USER gotenberg
