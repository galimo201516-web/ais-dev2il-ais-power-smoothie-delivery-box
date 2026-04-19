FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

RUN curl -Ls https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:$PATH"

RUN curl -Ls https://raw.githubusercontent.com/peterrietzler/ais-dev2il-ais-power-smoothie-delivery-box/refs/heads/exercises/scripts/setup-special-smoothie-maker-env.sh | sh

COPY . .

RUN uv sync --frozen

ENTRYPOINT ["uv", "run", "main.py"]
