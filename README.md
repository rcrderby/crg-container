# CRG Container

## Status

[![Super-Linter](https://github.com/timothyhull/crg-container/actions/workflows/lint-files.yml/badge.svg)](https://github.com/marketplace/actions/super-linter)

## Overview

This repository provides a mechanism to run the [CRG ScoreBoard](https://github.com/rollerderby/scoreboard "CRG ScoreBoard Git Repository") application for Roller Derby in a Docker Container with Docker Compose.  Why run CRG in a Docker Container?

- Simplicity
- Portability
- Predictability

## Requirements

1. Computer running Windows, macOS, or Linux.
2. Installation of [Docker Desktop](https://www.docker.com/products/docker-desktop "Download Docker Desktop").
3. Release of [CRG ScoreBoard](https://github.com/rollerderby/scoreboard/releases "CRG ScoreBoard Releases").

## Instructions

<details>
    <summary>
        1. Download and extract a <a href=https://github.com/rollerderby/scoreboard/releases title="CRG ScoreBoard Releases">CRG ScoreBoard release</a>:
    </summary>

- TODO

</details>

---

<details>
    <summary>
        2. Install Docker Desktop:
    </summary>

- System requirements:
  - [Windows](https://docs.docker.com/desktop/install/windows-install "Docker Desktop for Windows System Requirements")
  - [macOS](https://docs.docker.com/desktop/install/mac-install "Docker Desktop for macOS System Requirements")
  - [Linux](https://docs.docker.com/desktop/install/linux-install "Docker Desktop for Linux System Requirements")

</details>

---

 <details>
    <summary>
        3. Check the status of your Docker runtime:
    </summary>

```shell
# Docker Engine command input
docker --version
```

```shell
# Docker Engine response output
Docker version 26.0.0, build 2ae903e
```

</details>

---

<details>
    <summary>
        4. Clone the CRG Container Git repository:
    </summary>

```shell
# Git command input
git clone git@github.com:timothyhull/crg-container
```

```shell
# Git response output
# TODO
```

</details>

---

<details>
    <summary>
        5. Set environment variables:
    </summary>

- <details>
    <summary>
        macOS/Linux Terminal:
    </summary>

    ```shell
    # Create an environment variables file
    touch .env
    ```

    ```shell
    # Add environment variables to file
    echo CRG_MOUNT_DIR=crg-container >> .env
    echo CRG_SOURCE_DIR=crg-scoreboard_v2023.4 >> .env
    echo CRG_SOURCE_VOLUME=~/code/personal/crg-container >> .env
    ```

    </details>

- <details>
    <summary>
        Windows PowerShell:
    </summary>

    ```powershell
    # Create an environment variables file
    New-Item -Name ".env" -ItemType File
    ```

    ```powershell
    # Add environment variables to file
    Add-Content -Path .env "CRG_MOUNT_DIR=crg-container"
    Add-Content -Path .env "CRG_SOURCE_DIR=crg-scoreboard_v2023.4"
    Add-Content -Path .env "CRG_SOURCE_VOLUME=~/code/personal/crg-container"
    ```

    </details>
</details>

---

<details>
<summary>
    6. Run CRG with Docker Compose:
</summary>

- <details>
    <summary>
        Docker Compose command input:
    </summary>

    ```shell
    docker compose up
    ```

    </details>

- <details>
    <summary>
        Docker Compose command sample output:
    </summary>

    ```shell
    [+] Running 1/0
    ✔ Network crg-container_default            Created                                                                     0.0s 
    ⠋ Container crg-container-crg-container-1  Created                                                                     0.0s 
    Attaching to crg-container-1
    crg-container-1  | Found existing autosave dir - skipping import
    crg-container-1  | CRG ScoreBoard version v2023.4
    crg-container-1  | 2024-05-02 21:40:09.875:INFO::main: Logging initialized @533ms to org.eclipse.jetty.util.log.StdErrLog
    crg-container-1  | Loaded auto-saved scoreboard from ./config/autosave/scoreboard-0-secs-ago.json
    crg-container-1  |
    crg-container-1  | vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    crg-container-1  | vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    crg-container-1  | Double-click/open the 'start.html' file, or
    crg-container-1  | Open a web browser (either Google Chrome or Mozilla Firefox recommended) to:
    crg-container-1  | 	http://localhost:8000
    crg-container-1  | or try one of these URLs:
    crg-container-1  | 	http://172.18.0.2:8000/
    crg-container-1  | 	http://[fe80:0:0:0:42:acff:fe12:2%eth0]:8000/
    crg-container-1  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    crg-container-1  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    crg-container-1  |
    ```

    </details>

</details>

---

<details>
<summary>
    7. Stop CRG
</summary>

- Press `Ctrl+C` to stop CRG.

- <details>
    <summary>
        Docker Compose command sample output:
    </summary>

    ```shell
    Gracefully stopping... (press Ctrl+C again to force)
    [+] Stopping 1/1
    ✔ Container crg-container-crg-container-1  Stopped                                                                     0.5s 
    canceled
    ```
</details>

---

<details>
<summary>
    8. Review health check logs:
</summary>
</details>

## FAQ

## Development

TODO
