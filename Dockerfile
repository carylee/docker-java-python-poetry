FROM python:3.8.10-slim

RUN mkdir -p /usr/share/man/man1

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup"

ENV PATH="/root/.local/bin:$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

RUN apt update \
    && apt install --no-install-recommends -y \
        curl \
        build-essential \
        openssh-client \
        git \
        openjdk-11-jre

ENV POETRY_VERSION=1.2

RUN pip install pipx
RUN pipx install "poetry==$POETRY_VERSION"

WORKDIR /app
