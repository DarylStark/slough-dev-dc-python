# hadolint ignore=DL3007
FROM dast1986/slough-dev-dc-generic-base:latest AS base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install `uv`
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    echo "# Autocompletion for UV" >> .bashrc.local && \
    /home/developer/.cargo/bin/uv generate-shell-completion bash >> .bashrc.local && \
    echo >> .bashrc.local

# `uvx` has no `generate-shell-completion` command, so we have to add it
# manually
COPY ./uvx/bash-completion.sh /home/developer/uvx-bash-completion.sh
RUN echo "# Autocompletion for UVX" >> .bashrc.local && \
    cat /home/developer/uvx-bash-completion.sh >> .bashrc.local && \
    echo >> .bashrc.local && \
    rm /home/developer/uvx-bash-completion.sh

# Configure `uv`
ENV UV_PYTHON_PREFERENCE=only-managed

# Install `ruff`
RUN curl -LsSf https://astral.sh/ruff/install.sh | sh && \
    echo "# Autocompletion for Ruff" >> .bashrc.local && \
    /home/developer/.cargo/bin/ruff generate-shell-completion bash >> .bashrc.local && \
    echo >> .bashrc.local

# Install a few Python versions
RUN /home/developer/.cargo/bin/uv python install 3.12

# Configure Starship
ENV PROMPTNAME="PYTHON"

# Set the default command to bash
CMD ["bash"]