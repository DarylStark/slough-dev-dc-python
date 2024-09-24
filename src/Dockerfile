# Use a minimal base image
FROM slough-dev-dc-generic-base:0.0.1 AS base

# Install `uv`
RUN wget https://astral.sh/uv/install.sh
RUN chmod +x install.sh
RUN ./install.sh
RUN rm install.sh

# Install Python
# Normally, we would install Python using `uv`, but `uv` doesn't provide images
# for Alpine (yet). Maybe later, it will.
# https://github.com/astral-sh/uv/issues/6392
RUN sudo apk add --no-cache python3=3.12.6-r0

# Configure Starship
ENV PROMPTNAME="PYTHON"

# Set the default command to bash
CMD ["bash"]