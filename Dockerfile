FROM madhacking/bats-kcov:20190807

COPY emtrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
