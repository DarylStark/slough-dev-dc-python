# Use a minimal base image
FROM slough-dev-dc-generic-base:0.0.3 AS base

# Install `uv`
RUN wget https://astral.sh/uv/install.sh
RUN chmod +x install.sh
RUN ./install.sh
RUN rm install.sh

# Install `ruff`
RUN wget https://astral.sh/ruff/install.sh
RUN chmod +x install.sh
RUN ./install.sh
RUN rm install.sh

# Generate shell completion for uv
RUN echo 'eval "$(/home/developer/.cargo/bin/uv generate-shell-completion bash)"' >> .bashrc.local
RUN echo 'eval "$(/home/developer/.cargo/bin/ruff generate-shell-completion bash)"' >> .bashrc.local

# Install a few Python versions
RUN /home/developer/.cargo/bin/uv python install 3.12

# Configure Starship
ENV PROMPTNAME="PYTHON"

# Set the default command to bash
CMD ["bash"]