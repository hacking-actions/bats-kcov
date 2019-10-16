FROM madhacking/bats-kcov

COPY emtrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
