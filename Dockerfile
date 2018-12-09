FROM 0xcaff/koel

COPY koel-entrypoint /usr/local/bin/
ENTRYPOINT ["koel-entrypoint"]
CMD ["apache2-foreground"]
