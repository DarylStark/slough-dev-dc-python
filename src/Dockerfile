# hadolint ignore=DL3007
FROM dast1986/slough-dev-dc-generic-base:1.0.0 AS base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install `uv`
RUN echo "# Autocompletion for UV" >> .bashrc.local && \
    /home/developer/.local/bin/uv generate-shell-completion bash >> .bashrc.local && \
    echo >> .bashrc.local

# Configure `uv`
ENV UV_PYTHON_PREFERENCE=only-managed

# Install `ruff` and `mypy`
RUN /home/developer/.local/bin/uv tool install ruff && \
    echo "# Autocompletion for Ruff" >> .bashrc.local && \
    /home/developer/.local/bin/ruff generate-shell-completion bash >> .bashrc.local && \
    echo >> .bashrc.local && \
    /home/developer/.local/bin/uv tool install mypy

# Install a few Python versions
RUN /home/developer/.local/bin/uv python install 3.14

# Configure Starship
ENV PROMPTNAME="PYTHON"

# Set the default command to bash
CMD ["bash"]