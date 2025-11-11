FROM docker:stable

EXPOSE 6379

COPY script/entrypoint.sh /entrypoint.sh
COPY script/cleanup.sh /cleanup.sh
RUN chmod +x /entrypoint.sh /cleanup.sh
ENTRYPOINT ["/entrypoint.sh"]
