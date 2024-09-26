# Use a minimal base image
FROM slough-dev-dc-generic-base:0.0.3 AS base

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install `uv`
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    echo "# Autocompletion for UV" >> .bashrc.local && \
    /home/developer/.cargo/bin/uv generate-shell-completion bash >> .bashrc.local && \
    echo >> .bashrc.local

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