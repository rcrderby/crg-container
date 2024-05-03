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

1. Download and extract a [CRG ScoreBoard release](https://github.com/rollerderby/scoreboard/releases "CRG ScoreBoard Releases").

---

2. Install Docker Desktop:

    - System requirements:
        - [Windows](https://docs.docker.com/desktop/install/windows-install "Docker Desktop for Windows System Requirements")
        - [macOS](https://docs.docker.com/desktop/install/mac-install "Docker Desktop for macOS System Requirements")
        - [Linux](https://docs.docker.com/desktop/install/linux-install "Docker Desktop for Linux System Requirements")

---

3. Check the status of your Docker runtime:

    ```shell
    # Docker Engine command input
    docker --version
    ```

    ```shell
    # Docker Engine example response output
    Docker version 26.0.0, build 2ae903e
    ```

---

4. Clone the CRG Container Git repository:

    ```shell
    # Git command input
    git clone git@github.com:timothyhull/crg-container
    ```

    ```shell
    # Git response example output
    # TODO
    ```

---

5. Set environment variables:

    - macOS/Linux Terminal:

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

    - Windows PowerShell:

        ```powershell
        # Create an environment variables file
        New-Item -Name ".env" -ItemType File
        ```

        ```powershell
        # Add environment variables to file
        Add-Content -Path ".env" "CRG_MOUNT_DIR=crg-container"
        Add-Content -Path ".env" "CRG_SOURCE_DIR=crg-scoreboard_v2023.4"
        Add-Content -Path ".env" "CRG_SOURCE_VOLUME=~/code/personal/crg-container"
        ```

---

6. Run CRG with Docker Compose:

    ```shell
    # Docker Compose command input
    docker compose up
    ```

    ```shell
    # Docker Compose command sample output
        [+] Building 56.1s (7/7) FINISHED                                                                       docker:desktop-linux
    => [crg-container internal] load build definition from Dockerfile                                                      0.0s
    => => transferring dockerfile: 512B                                                                                    0.0s
    => [crg-container internal] load metadata for docker.io/library/openjdk:latest                                         0.0s
    => [crg-container internal] load .dockerignore                                                                         0.0s
    => => transferring context: 229B                                                                                       0.0s
    => [crg-container 1/3] FROM docker.io/library/openjdk:latest                                                           0.0s
    => [crg-container 2/3] RUN microdnf upgrade -y --nodocs &&     microdnf clean all                                     55.3s
    => [crg-container 3/3] WORKDIR crg-container                                                                           0.0s 
    => [crg-container] exporting to image                                                                                  0.8s 
    => => exporting layers                                                                                                 0.7s 
    => => writing image sha256:e6a67731286f20afdaead94aafee07197ca82df627ce1f2ba99ca78ac63f319a                            0.0s 
    => => naming to docker.io/library/crg-container-crg-container                                                          0.0s 
    [+] Running 1/1                                                                                                              
    ✔ Network crg-container_default            Created                                                                     0.0s 
    ⠋ Container crg-container-crg-container-1  Created                                                                     0.0s 
    Attaching to crg-container-1
    crg-container-1  | Found existing autosave dir - skipping import
    crg-container-1  | CRG ScoreBoard version v2023.4
    crg-container-1  | 2024-05-03 01:32:23.293:INFO::main: Logging initialized @482ms to org.eclipse.jetty.util.log.StdErrLog
    crg-container-1  | Loaded auto-saved scoreboard from ./config/autosave/scoreboard-0-secs-ago.json
    crg-container-1  | 
    crg-container-1  | vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    crg-container-1  | vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    crg-container-1  | Double-click/open the 'start.html' file, or
    crg-container-1  | Open a web browser (either Google Chrome or Mozilla Firefox recommended) to:
    crg-container-1  | 	http://localhost:8000
    crg-container-1  | or try one of these URLs:
    crg-container-1  | 	http://172.19.0.2:8000/
    crg-container-1  | 	http://[fe80:0:0:0:42:acff:fe13:2%eth0]:8000/
    crg-container-1  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    crg-container-1  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    crg-container-1  | 
    ```

---

7. Stop CRG

    - Press `Ctrl+C` to stop CRG.

        ```shell
        # Docker Compose command sample output
        Gracefully stopping... (press Ctrl+C again to force)
        [+] Stopping 1/1
        ✔ Container crg-container-crg-container-1  Stopped                                                                     0.5s 
        canceled
        ```

---

8. Review health check logs:

## FAQ

## Development

TODO
