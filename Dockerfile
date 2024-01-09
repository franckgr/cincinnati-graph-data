FROM registry.access.redhat.com/ubi8/ubi:8.1

# RUN curl -L -o cincinnati-graph-data.tar.gz https://api.openshift.com/api/upgrades_info/graph-data
COPY ./cincinnati-graph-data.tar.gz ./
RUN mkdir -p /var/lib/cincinnati-graph-data && tar zxvf ./cincinnati-graph-data.tar.gz -C /var/lib/cincinnati-graph-data/ --no-overwrite-dir --no-same-owner

CMD ["/bin/bash", "-c" ,"exec cp -rp /var/lib/cincinnati-graph-data/* /var/lib/cincinnati/graph-data"]
