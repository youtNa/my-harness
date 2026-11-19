FROM ghcr.io/all-hands-ai/openhands:main

# OpenHands local runtime uses tmux to manage the agent process.
USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends tmux \
    && rm -rf /var/lib/apt/lists/*

# The OpenHands image includes Playwright but not its browser binary.
RUN /app/.venv/bin/playwright install --with-deps chromium
