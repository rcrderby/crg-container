# CRG Container

## Status

[![Super-Linter](https://github.com/timothyhull/crg-container/actions/workflows/lint-files.yml/badge.svg)](https://github.com/marketplace/actions/super-linter)

## Overview

This repository provides a mechanism to easily run the [CRG ScoreBoard](https://github.com/rollerderby/scoreboard "CRG ScoreBoard Git Repository") application for Roller Derby in a Docker Container, using Docker Compose to automate the deployment and launch of CRG.  Why run CRG in a Docker Container?

- Simplicity
- Portability
- Predictability

## Components

1. [`Dockerfile`](https://github.com/timothyhull/crg-container/blob/timothyhull/Update-%60READMEmd%60/Dockerfile "Dockerfile") to create a Docker Image with a Java Runtime Environment (JRE).
2. [`docker-compose.yml`](https://github.com/timothyhull/crg-container/blob/timothyhull/Update-%60READMEmd%60/docker-compose.yml "CRG Container Service Definition File") to automate the deployment of CRG in a Docker container.

## Requirements

1. Computer running Windows, macOS, or Linux.
2. Installation of [Docker Desktop](https://www.docker.com/products/docker-desktop "Download Docker Desktop").
3. Release of [CRG ScoreBoard](https://github.com/rollerderby/scoreboard/releases "CRG ScoreBoard Releases").

## Instructions

1. Download and extract a [CRG ScoreBoard release](https://github.com/rollerderby/scoreboard/releases "CRG ScoreBoard Releases").

---

2. [Install Docker Desktop](https://docs.docker.com/desktop "Docker Desktop Installation"):

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
    # Successful Docker Engine example response output
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

5. Create an environment variables file within the cloned `crg-container` folder:

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

6. Disable the CRG GUI in the `scoreboard.sh` CRG launch script to allow CRG to run within a Docker Container:

- The [`scoreboard.sh` file](https://github.com/rollerderby/scoreboard/blob/dev/scoreboard.sh#L5 "scoreboard.sh Source File") resides at the root of the extracted CRG application directory.

```shell
# Add a '# ' prefix to the following line in scoreboard.sh
GUI="--gui"
```

```shell
# Example of a disabled CRG GUI
# GUI="--gui"
```

---

7. Run CRG with Docker Compose:

    ```shell
    # Docker Compose command input
    docker compose up
    ```

    ```shell
    # Successful Docker Compose command sample output
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
    crg-container-1  | http://localhost:8000
    crg-container-1  | or try one of these URLs:
    crg-container-1  | http://172.19.0.2:8000/
    crg-container-1  | http://[fe80:0:0:0:42:acff:fe13:2%eth0]:8000/
    crg-container-1  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    crg-container-1  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    crg-container-1  | 
    ```

---

8. Run the CRG application:

    - Open a [recommended web browser application](https://github.com/rollerderby/scoreboard#web-browser "CRG ScoreBoard Documentation Browser Recommendation").
    - Navigate to [http://localhost:8000](http://localhost:8000 "CRG Application Launch Page").
    - Run the CRG application in accordance with the [CRG ScoreBoard documentation](https://github.com/rollerderby/scoreboard/wiki "CRG ScoreBoard Documentation").

---

9. Stop CRG

    - Press `Ctrl+C` to stop CRG.

        ```shell
        # Successful Docker Compose command sample output
        Gracefully stopping... (press Ctrl+C again to force)
        [+] Stopping 1/1
        ✔ Container crg-container-crg-container-1  Stopped                                                                     0.5s 
        canceled
        ```
---

10. Review health check logs (optional):

The health check is a recurring `curl` HTTP request to the CRG web application server, and a `200 OK` response indicates the request is successful.  The health check configuration is available for review in the [`docker-compose.yml` file](https://github.com/timothyhull/crg-container/blob/timothyhull/Update-%60READMEmd%60/docker-compose.yml#L39-L44 "Docker Compose Health Check").

```shell
# Check the health of the CRG container
docker inspect -f "{{ json .State.Health }}" crg-container-crg-container-1
```

```jsonc
// Successful health check command sample output
{
  "Status": "healthy",
  "FailingStreak": 0,
  "Log": [
    {
      "Start": "2024-05-03T12:00:00.000000000Z",
      "End": "2024-05-03T12:00:00.000000000",
      "ExitCode": 0,
      "Output": "HTTP/1.1 200 OK\r\nDate: Fri, 03 May 2024 01:50:54 GMT\r\nSet-Cookie: CRG_SCOREBOARD=node0v5ap3t21va5cq5zx2cqaekfe36.node0; Path=/; Expires=Sat, 18-May-2024 12:00:00 GMT; Max-Age=1296000; HttpOnly; SameSite=Lax\r\nExpires: Thu, 01 Jan 1970 00:00:00 GMT\r\nLast-Modified: Tue, 03 Oct 2023 00:56:04 GMT\r\nContent-Type: text/html;charset=utf-8\r\nAccept-Ranges: bytes\r\n"
    }
  ]
}
```

## FAQ

- Accessing the CRG container over a network connection.
- TODO

## Development

- Visual Studio Code Development Container.
- TODO

## References

- [CRG ScoreBoard Git Repository](https://github.com/rollerderby/scoreboard "CRG ScoreBoard Git Repository")
- [Docker Compose documentation](https://docs.docker.com/compose "Docker Compose Documentation")
