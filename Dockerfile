FROM python:3.12-slim

WORKDIR /workspace
ENV PATH /root/.local/bin:$PATH
COPY pyproject.toml poetry.lock /workspace/

RUN apt-get update && \
    apt-get install --no-install-recommends -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sSL https://install.python-poetry.org | python3 - && \
    poetry config virtualenvs.create false && \
    poetry install
