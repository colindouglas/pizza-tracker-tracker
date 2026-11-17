FROM ghcr.io/astral-sh/uv:python3.12-trixie-slim@sha256:b12436aceed37b21524b327362bd67e73a284b5d52f4f6be0e047dd8e4c4eb90

WORKDIR /app

COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev

COPY tracker.py ./

ENV DATA_DIR=/data
ENV PYTHONUNBUFFERED=1
VOLUME /data

CMD ["uv", "run", "python", "tracker.py"]
