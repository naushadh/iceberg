FROM openjdk:8

# hadolint ignore=DL3008
RUN \
  echo "Setup system deps" && \
    apt-get update -y && \
  echo "Setup app deps: https://www.ianlewis.org/en/creating-smaller-docker-images" && \
    apt-get install --no-install-recommends -y gpg && \
    export GPG_TTY=$(tty) && \
  echo "Purge build artifacts" && \
    apt-get purge -y --auto-remove $build_deps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
