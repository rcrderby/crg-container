# CRG Container

## Status

[![Super-Linter](https://github.com/timothyhull/crg-container/actions/workflows/lint-files.yml/badge.svg)](https://github.com/marketplace/actions/super-linter)

## Overview

This repository provides a mechanism to run the [CRG ScoreBoard](https://github.com/rollerderby/scoreboard "CRG ScoreBoard Git Repository") application for Roller Derby in a Docker Container [^1], using Docker Compose [^2] to automate the deployment and launch of CRG.  Why run CRG in a Docker Container?

- Simplicity:
  - Follow one-time [setup instructions](#setup-instructions "Setup Instructions") and then easily launch CRG.
  - Build, deploy, and run CRG with the same [single command](#run-instructions "Run Instructions") on any Windows, macOS, or Linux computer with Docker installed.
- Security:
  - There is no need to install a JRE [^3] on your computer.
  - The JRE instance that runs CRG exists in an isolated, ephemeral Docker Container.

## Requirements

1. Computer running Windows, macOS, or Linux.
2. Installation of [Docker Desktop](https://docs.docker.com/desktop "Docker Desktop Overview").
3. Downloaded release of [CRG ScoreBoard](https://github.com/rollerderby/scoreboard/releases "CRG ScoreBoard Releases").
4. Downloaded release of this repository ([crg-container](https://github.com/timothyhull/crg-container/releases "crg-container Releases")).

## Setup Instructions

### 1. Download and Install Docker Desktop

1. Navigate to the [Docker Desktop](https://www.docker.com/products/docker-desktop "Download Docker Desktop") downloads page.
2. Download the appropriate Docker Desktop release for your OS [^4].
3. Follow the OS-specific instructions to install Docker Desktop on your computer:

    - [Windows](https://docs.docker.com/desktop/install/windows-install "Docker Desktop for Windows Installation Guide")
    - [macOS](https://docs.docker.com/desktop/install/mac-install "Docker Desktop for macOS Installation Guide")
    - [Linux](https://docs.docker.com/desktop/install/linux-install "Docker Desktop for Linux Installation Guide")  

### 2. Check The Status of Your Docker Runtime

After installing Docker Desktop, verify the Docker Engine is available

1. Open Windows PowerShell or a macOS/Linux Terminal window.

    <details>
      <summary>
        Enter this command to confirm the Docker Engine is active:
      </summary>

      ```shell
      docker --version
      ```

  </details>

<details>
  <summary>
    Confirm the response from the Docker Engine looks something like this:
  </summary>

  ```shell
  Docker version 26.0.0, build 2ae903e
  ```

</details>

### 3. Clone the CRG Container Git Repository

<details>
  <summary>
    Git Clone command input:
  </summary>

  ```shell
  git clone git@github.com:timothyhull/crg-container
  ```

</details>

<details>
  <summary>
    Git Clone response example output:
  </summary>

  ```shell
  # TODO
  ```

</details>

### 4. Download and Extract a Release of CRG Scoreboard

- Navigate to the [CRG ScoreBoard Releases page](https://github.com/rollerderby/scoreboard/releases "CRG ScoreBoard Releases").


### 5. Check Environment Variables

If necessary, you may overwrite the default environment variables file ([.env.default](https://github.com/timothyhull/crg-container/blob/main/.env.default "Default Environment Variables File")) within the cloned `crg-container` folder.

<details>
  <summary>
    Option 1 - Use default environment variables and values (no action required):
  </summary>

```shell
# Local path to the 'crg-container' folder extracted from this repo
## Default value is the current working directory
CRG_SOURCE_VOLUME=.

# Local path relative to CRG_SOURCE_VOLUMEfor the extracted CRG application from the CRG ScoreBoard Git Repository
## Default value is CRG version 2023.4
CRG_SOURCE_DIR=crg-scoreboard_v2023.4

# Name of the folder to create and mount files to on the CRG container instance
## Default value is 'crg-container'
CRG_MOUNT_DIR=crg-container
```

</details>

<details>
  <summary>
    Option 2 - Use a custom environment variable file:
  </summary>

1. Create a file at the root of the cloned crg-container repository named `.env`.

2. Customize the `.env` file with the following template:

    ```shell
    # Environment variable file template
    CRG_SOURCE_VOLUME=
    CRG_SOURCE_DIR=
    CRG_MOUNT_DIR=
    ```

3. Create an environment variable named `ENV_FILE` and set the value to the path to the `.env` file:

    ```shell
    # macOS and Linux example syntax
    export ENV_FILE=.env
    ```

    ```powershell
    # Windows PowerShell example syntax
    $env:ENV_FILE = '.env'
    ```

</details>

### 6. Disable the CRG GUI Option in the `scoreboard.sh` CRG Launch Script

TODO: Necessary to allow CRG to run within a Docker Container.

<details>
  <summary>
    TODO: Comment the GUI line:
  </summary>

- The [`scoreboard.sh` file](https://github.com/rollerderby/scoreboard/blob/dev/scoreboard.sh#L5 "scoreboard.sh Source File") resides at the root of the extracted CRG application directory.

  ```shell
  # Add a '# ' prefix to the following line in scoreboard.sh
  GUI="--gui"
  ```

  ```shell
  # Example of a disabled CRG GUI
  # GUI="--gui"
  ```

</details>

## Run Instructions

### 1. Launch the CRG Container With Docker Compose

<details>
  <summary>
    Docker Compose command input:
  </summary>

```shell
docker compose up
```

</details>

<details>
  <summary>
    Successful Docker Compose Command Sample Output:
  </summary>

```shell
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

</details>

### 2. Review CRG Container Health Check Status (optional)

TODO: Check the status of the Docker Compose health check:

<details>
  <summary>
    Overview:
  </summary>

The health check is a recurring `curl` HTTP request to the CRG web application server, and a `200 OK` response indicates the request is successful.  The health check configuration is available for review in the [`docker-compose.yml` file](https://github.com/timothyhull/crg-container/blob/main/docker-compose.yml "Docker Compose Health Check").

</details>

<details>
  <summary>
    Health Check Command Input:
  </summary>

```shell
# Check the health of the most recently-created container
docker inspect -f "{{ json .State.Health }}" $(docker ps -lq)
```

</details>

<details>
  <summary>
    Successful Health Check Command Output Example:
  </summary>

```jsonc
// Successful health check command example output (formatted as JSON with JQ)
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

</details>

### 3. Access the CRG Web Application

1. Open a [recommended web browser application](https://github.com/rollerderby/scoreboard#web-browser "CRG ScoreBoard Documentation Browser Recommendation").
2. Navigate to [http://localhost:8000](http://localhost:8000 "CRG Application Launch Page").
3. Run the CRG application in accordance with the [CRG ScoreBoard documentation](https://github.com/rollerderby/scoreboard/wiki "CRG ScoreBoard Documentation").

### 4. Stop the CRG Application

TODO: When finished, stop CRG.

Press `Ctrl+C` to stop CRG.

<details>
  <summary>
    Successful Docker Compose command sample output:
  </summary>

```shell
Gracefully stopping... (press Ctrl+C again to force)
[+] Stopping 1/1
✔ Container crg-container-crg-container-1  Stopped                                                                     0.5s 
canceled
```

</details>

## FAQ

- Accessing the CRG container over a network connection.
- TODO

## Docker Components

- [`Dockerfile`](https://github.com/timothyhull/crg-container/blob/main/Dockerfile "Dockerfile") to create a Docker Image with JRE.
- [`docker-compose.yml`](https://github.com/timothyhull/crg-container/blob/main/docker-compose.yml "CRG Container Service Definition File") to automate the deployment of CRG in a Docker Container.

## Development

- Visual Studio Code Development Container.
- TODO

## References

- [CRG ScoreBoard Git Repository](https://github.com/rollerderby/scoreboard "CRG ScoreBoard Git Repository")
- [Docker Compose documentation](https://docs.docker.com/compose "Docker Compose Documentation")

---
[^1]: [What is a Docker Container?](https://www.docker.com/resources/what-container "What is a Docker Container?")
[^2]: [Docker Compose Overview](https://docs.docker.com/compose "Docker Compose Overview")
[^3]: JRE: Java Runtime Environment
[^4]: OS: Operating System
