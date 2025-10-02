# My PowerShell's Configuration
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/M1CK3R/powerConfig)

This repository contains my personal PowerShell profile configuration (`profile.ps1`). This script customizes the terminal experience by adding a custom banner, session information, useful aliases, and functions for interacting with a local Large Language Model (LLM).

## Features

The `profile.ps1` script runs automatically every time a new PowerShell session is started and provides the following features:

### 1. Dynamic Welcome Banner
- Displays a custom ASCII art banner upon startup.
- Shows a special "Nyan¬, M1CK3R-chan!" message if a `Cargo.toml` file is detected in the current directory, indicating a Rust project (JK XD).

### 2. Session Information
- Prints the current session start date and time.
- Displays the installed PowerShell version.

### 3. Command Shortcuts (Aliases)
- `visual`: Opens Visual Studio Code.
- `dck`: Launches the Docker Desktop application.

*Note: You will need to update the file paths in the script to match your local installation paths for these applications.*

### 4. Docker Status
- Checks for running Docker containers using `docker ps`.
- Reports whether containers are active, if no containers are active, or if the Docker daemon is not available.

### 5. Local LLM Integration
This profile includes several functions to interact with a local AI model server (like LM Studio in my case) running on `http://localhost:1234` (LM Studio's Default Port).

- **`obtenerModelosLM`**: Fetches and lists the available models from the local LLM server.
- **`pregunta <prompt>`**: Sends a raw prompt to the completions endpoint for a direct text response.
- **`chat <message>`**: Interacts with the chat completions endpoint using a default temperature (`0.7`) for balanced responses.
- **`chatCreativo <message>`**: Same as `chat`, but with a higher temperature (`1.7`) for more creative and varied outputs.
- **`chatConciso <message>`**: Same as `chat`, but with a very low temperature (`0.07`) for more deterministic and straightforward responses.

## Installation

1.  Open a PowerShell terminal.
2.  Find the path to your PowerShell profile file by running the command:
    ```powershell
    
    $PROFILE
    
    ```
3.  If the file does not exist, create it:
    ```powershell
    
    New-Item -Path $PROFILE -Type File -Force
    
    ```
4.  Copy the contents of the `profile.ps1` file from this repository into your profile file.
5.  Save the file and restart your PowerShell terminal to see the changes.

## Configuration

- **Aliases**: You must update the hardcoded paths for the `visual` and `dck` aliases to match the locations of those programs on your system.
- **LLM Functions**: For the AI helper functions (`pregunta`, `chat`, etc.) to work, you need to have a local LLM server, such as [LM Studio](https://lmstudio.ai/), running and serving a model at `http://localhost:1234`.
