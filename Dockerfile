FROM 0xcaff/koel

ENV MEDIA_PATH=/music

# Install dependencies.
RUN apt-get update && \
  apt-get install --yes inotify-tools supervisor && \
  apt-get clean && \
  mkdir -p /var/log/supervisor
  
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY koel-entrypoint /usr/local/bin/
COPY koel-watch /usr/local/bin/
RUN chmod +x /usr/local/bin/koel-entrypoint /usr/local/bin/koel-watch

ENTRYPOINT ["koel-entrypoint"]
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
