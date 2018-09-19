FROM python:2-jessie
MAINTAINER Raphaël Droz <raphael.droz@gmail.com>

RUN wget -O zanata-1.5.2.tar.gz  "https://codeload.github.com/zanata/zanata-python-client/tar.gz/v1.5.2" && \
    tar xf zanata-1.5.2.tar.gz && \
    cd zanata-python-client-1.5.2 && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install . && \
    apt update && apt install -y gettext && rm -f /var/lib/apt/lists/deb*

CMD ["/bin/bash"]
