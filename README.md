# Vorpal-GDExtension

VORPAL as a GDExtension plugin for the Godot Game Engine.

## Prerequisites

> NOTE: These instructions assume you are using a **Linux** system.

Before you start, ensure you have the following prerequisites installed:

- Godot 4.3-stable (download from the [official Godot website](https://godotengine.org/download/archive/4.3-stable/))
- GCC 9+ (download from the [official GCC website](https://gcc.gnu.org/releases.html))
- Python 3.8+ (download from the [official Python website](https://www.python.org/downloads/))
- Scons 4.0+ (download from the [official Scons website](https://scons.org/pages/download.html))

If you are using **Debian/Ubuntu**, you can install the required packages by running this one-liner on terminal:

```bash
sudo apt-get update
sudo apt-get install -y \
build-essential \
scons \
pkg-config \
libx11-dev \
libxcursor-dev \
libxinerama-dev \
libgl1-mesa-dev \
libglu1-mesa-dev \
libasound2-dev \
libpulse-dev \
libudev-dev \
libxi-dev \
libxrandr-dev \
libwayland-dev
```

## Compiling the GDExtension plugin

The Vorpal GDExtension plugin is designed to be built using Scons. Follow these steps to compile the plugin:

1. Clone the repository:

    ```bash
    git clone https://github.com/Xivor/Vorpal-GDExtension.git
    ```

2. Navigate to the repository directory:

    ```bash
    cd Vorpal-GDExtension
    ```

3. Build the plugin using Scons:

    ```bash
    scons platform=linux
    ```

### Testing with the demo project

To test the compiled plugin, you can use the provided demo project. Follow these steps:

1. Open Godot 4.3-stable.
2. Import the `project.godot` file located in the `Vorpal-GDExtension/demo` directory.
3. Run the project.

This will open a simple scene that should make sound. Check the console output for any errors or logs.

## References

These instructions are based on the official Godot documentation and other resources:

- <https://docs.godotengine.org/en/stable/contributing/development/compiling/compiling_for_linuxbsd.html>
- <https://docs.godotengine.org/en/stable/tutorials/scripting/gdextension/gdextension_cpp_example.html>
