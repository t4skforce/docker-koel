FROM 0xcaff/koel

ENV MEDIA_PATH=/music

# Install dependencies.
RUN apt-get update && \
  apt-get install --yes inotify-tools && \
  apt-get clean

COPY koel-entrypoint /usr/local/bin/
COPY koel-watch /usr/local/bin/
RUN chmod +x /usr/local/bin/koel-entrypoint

ENTRYPOINT ["koel-entrypoint"]
CMD ["apache2-foreground"]
