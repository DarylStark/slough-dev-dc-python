# Slough - Dev Container - Python

A Docker-based development container for Python development with modern tooling and best practices.

## About Slough

This container is part of the **Slough project** by [Daryl Stark](https://github.com/DarylStark). The Slough project aims to deliver consistent development tooling and standardized development containers (dev containers) across different programming languages and environments. By using these containers, developers can ensure a uniform development experience regardless of their host operating system or local configuration.

## Features

This development container includes:

- **Python 3.14** - Latest Python version installed and ready to use
- **uv** - Fast Python package installer and resolver with shell completion
- **ruff** - An extremely fast Python linter and formatter with shell completion
- **mypy** - Static type checker for Python
- **Starship** - Cross-shell prompt with custom PYTHON configuration
- **Docker-in-Docker** - Access to Docker socket for containerized workflows
- Based on `slough-dev-dc-generic-base` with additional development tools

## Using This Container

### Image Tag

The Docker image for this container follows the naming convention:

```
dast1986/slough-dev-dc-python:1.0.0
```

Format: `dast1986/<repository-name>:<version>`

### As a Dev Container

To use this container as a development container in your project:

1. **Create a `.devcontainer` directory** in your project root
2. **Add a `devcontainer.json` file** with the following configuration:

```json
{
  "name": "Python Development Container",
  "image": "dast1986/slough-dev-dc-python:1.0.0",
  "mounts": [
    "source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind"
  ],
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-python.python",
        "ms-python.vscode-pylance",
        "charliermarsh.ruff"
      ]
    }
  }
}
```

3. **Open in VS Code**: Open your project in Visual Studio Code
4. **Reopen in Container**: Press `F1` and select "Dev Containers: Reopen in Container"

### Direct Docker Usage

You can also run the container directly with Docker:

```bash
docker run -it --rm \
  -v "$(pwd):/workspace" \
  -w /workspace \
  dast1986/slough-dev-dc-python:1.0.0
```

## Working with Dev Containers

### General Tips

- **Install the Dev Containers extension** in Visual Studio Code for the best experience
- **Persistence**: Your workspace files are mounted into the container, so changes persist
- **Extensions**: Install VS Code extensions inside the container for optimal performance
- **Terminal**: Use the integrated terminal in VS Code to run commands inside the container

### Microsoft Windows Specific Tips

When using dev containers on Microsoft Windows:

1. **Use WSL 2**: Ensure you're using Windows Subsystem for Linux 2 (WSL 2) as your Docker backend
   - Open Docker Desktop settings
   - Go to "General" and ensure "Use the WSL 2 based engine" is enabled

2. **Store Projects in WSL**: For best performance, clone your repositories inside the WSL file system (e.g., `~/projects`) rather than Windows file system (`/mnt/c/`)

3. **Line Endings**: Configure Git to use LF line endings to avoid issues:
   ```bash
   git config --global core.autocrlf input
   ```

4. **Docker Desktop**: Make sure Docker Desktop is running before trying to use dev containers

5. **File Permissions**: If you encounter permission issues, ensure your Windows user has access to Docker Desktop

6. **Resource Allocation**: Allocate sufficient resources to Docker Desktop (Settings → Resources) - recommend at least 4GB RAM

## Container Configuration

### User Information

- **Username**: `developer`
- **Home Directory**: `/home/developer`
- **Sudo Access**: Available **without password** for administrative tasks
- **Shell**: Bash with custom configurations

### Python Environment

The container is configured with:

- **UV_PYTHON_PREFERENCE**: `only-managed` - uv will use only managed Python versions
- **Prompt**: Custom Starship prompt with "PYTHON" indicator

### Installed Tools

#### uv - Python Package Manager

`uv` is a fast Python package installer and resolver.

**Usage Examples:**

```bash
# Install a package
uv pip install requests

# Install from requirements.txt
uv pip install -r requirements.txt

# Create a virtual environment
uv venv

# Install a specific Python version
uv python install 3.13

# Run a command in a temporary environment
uv run --with flask flask run
```

#### ruff - Linter and Formatter

`ruff` is an extremely fast Python linter and code formatter.

**Usage Examples:**

```bash
# Lint your code
ruff check .

# Format your code
ruff format .

# Fix auto-fixable issues
ruff check --fix .

# Check a specific file
ruff check myfile.py
```

#### mypy - Type Checker

`mypy` is a static type checker for Python.

**Usage Examples:**

```bash
# Type check your code
mypy .

# Type check specific file
mypy myfile.py

# Type check with stricter settings
mypy --strict myfile.py
```

## Development Workflow

A typical development workflow in this container:

1. **Start the container**: Open your project in VS Code and reopen in container
2. **Install dependencies**: Use `uv pip install -r requirements.txt`
3. **Write code**: Use your favorite editor with full language support
4. **Lint and format**: Run `ruff check --fix . && ruff format .`
5. **Type check**: Run `mypy .` to catch type errors
6. **Test**: Run your test suite with pytest or your preferred testing framework
7. **Commit**: Changes are automatically synced to your host system

## Requirements

- **Docker**: Version 20.10 or higher
- **VS Code** (recommended): With the Dev Containers extension
- **Minimum RAM**: 2GB available for the container
- **Disk Space**: At least 2GB for the image and dependencies

## License

This project is licensed under the MIT License. See [LICENSE.md](LICENSE.md) for details.

## Links

- [Slough Project Organization](https://github.com/DarylStark)
- [Docker Hub Repository](https://hub.docker.com/r/dast1986/slough-dev-dc-python)
- [Report Issues](https://github.com/DarylStark/slough-dev-dc-python/issues)

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests to improve this development container.

---

**Maintained by Daryl Stark** - Part of the Slough project for consistent development tooling.
