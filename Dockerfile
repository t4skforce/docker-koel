FROM 0xcaff/koel

COPY koel-entrypoint /usr/local/bin/
RUN chmod +x /usr/local/bin/koel-entrypoint

ENTRYPOINT ["koel-entrypoint"]
CMD ["apache2-foreground"]
