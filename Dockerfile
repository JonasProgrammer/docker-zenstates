FROM python:3-stretch

WORKDIR /usr/local/src/zenstates

RUN apt-get update \
 && apt-get install --no-install-recommends -y unzip \
 && rm -rf /var/lib/apt/lists/* \
 && curl -Lo temp.zip https://github.com/r4m0n/ZenStates-Linux/archive/master.zip \
 && unzip -j temp.zip \
 && rm temp.zip

ENTRYPOINT ["/usr/bin/env", "python", "zenstates.py"]
CMD ["--list"]
