FROM python:3.11-slim-buster

RUN \
    sed -i -e's/ main/ main contrib non-free/g' /etc/apt/sources.list \
    && apt-get update --allow-unauthenticated \
    && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /

# Dependencies
COPY requirements.txt requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip pip install -r requirements.txt

COPY src/ src/
COPY tests/ tests/
COPY badges.sh badges.sh

# Tets
ENV PYTHONPATH=.
#CMD coverage run -m pytest tests/test.py -vv -p no:cacheprovider && coverage report && coverage xml
CMD ./badges.sh
