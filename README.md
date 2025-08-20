# CRG Container

## Status

[![Super-Linter](https://github.com/rcrderby/crg-container/actions/workflows/lint-files.yml/badge.svg)](https://github.com/marketplace/actions/super-linter)

## Overview

This repository provides a mechanism to run the [CRG ScoreBoard](https://github.com/rollerderby/scoreboard "CRG ScoreBoard Git Repository") application for Roller Derby in a Docker Container [^1], using Docker Compose [^2] to automate the deployment and launch of CRG.  Why run CRG in a Docker Container?

- Consistency:
  - There is no need to install a JRE [^3] on your computer; it's built into the Container.
  - CRG running in a Container behaves the same way whether you're running Windows, macOS, or Linux.
- Simplicity:
  - Follow one-time [setup instructions](#setup-instructions "Setup Instructions") and then easily switch between CRG versions, instances, etc.
  - Build, deploy, and run CRG with the same [single command](#run-instructions "Run Instructions") on any Windows, macOS, or Linux computer with Docker installed.
- Security:
  - The JRE instance that runs CRG exists in an isolated, ephemeral Docker Container that won't interfere with other applications on your computer.

## Requirements

1. Computer running Windows, macOS, or Linux.
2. Installation of [Docker Desktop](https://docs.docker.com/desktop "Docker Desktop Overview").
3. Release of the [CRG Container](./ "CRG Container GitHub Repository") GitHub repository.
4. Release of the [CRG ScoreBoard](https://github.com/rollerderby/scoreboard "CRG ScoreBoard GitHub Repository") GitHub repository.

## Setup Instructions

### Download and Install Docker Desktop

1. Navigate to the [Docker Desktop](https://www.docker.com/products/docker-desktop "Download Docker Desktop") downloads page.
2. Download the appropriate Docker Desktop release for your OS [^4].
3. Follow the OS-specific instructions to install Docker Desktop on your computer.

    <details open>
      <summary>
       :heavy_plus_sign: Docker Installation Instructions:
      </summary>

      - [Windows](https://docs.docker.com/desktop/install/windows-install "Docker Desktop for Windows Installation Guide")
      - [macOS](https://docs.docker.com/desktop/install/mac-install "Docker Desktop for macOS Installation Guide")
      - [Linux](https://docs.docker.com/desktop/install/linux-install "Docker Desktop for Linux Installation Guide")  

    </details>

---

### Check The Status of Your Docker Runtime

After installing Docker Desktop, open a Windows PowerShell or macOS/Linux Terminal window to verify the Docker Engine is available.

<details open>
  <summary>
    :heavy_plus_sign: Enter this command to confirm the Docker Engine is active:
  </summary>

  ```shell
  docker --version
  ```

</details>

<details open>
  <summary>
    :heavy_plus_sign: Confirm the response from the Docker Engine looks something like this:
  </summary>

  ```shell
  Docker version 28.3.2, build 578ccf6
  ```

</details>

---

### Download the the CRG Container Git Repository

The [CRG Container](./ "CRG Container GitHub Repository") Git repository contains the Docker and Docker Compose configuration that automate running CRG in a Container.  You need to download a copy of the repository files to your computer running Docker Desktop.

<details>
  <summary>
    :heavy_plus_sign: Option 1 - Download and extract the latest <strong>CRG Container</strong> release:
  </summary>

1. Navigate to the [CRG Container Releases](https://github.com/rcrderby/crg-container/releases "CRG Container Releases") page.

2. Locate the `Assets` section of the page to find the latest release and click on `Source code (zip)` or `Source code (tar.gz)` to download a compressed copy of the repository files.

3. Extract the compressed file to create a folder named `crg-container` that contains the CRG Container repository files.
  
</details>

<details>
  <summary>
    :heavy_plus_sign: Option 2 - Clone the repository with Git:
  </summary>

1. Open your preferred terminal application (Terminal, Git Bash, Windows PowerShell, etc.) to run Git [^5] commands.

2. Use the `git clone` command to fetch the repository files and place them within a new folder named `crg-container`.

    <details open>
      <summary>
        :heavy_plus_sign: Git clone command:
      </summary>

    ```shell
    git clone git@github.com:rcrderby/crg-container
    ```

    </details>

3. Review the `git clone` command response output (optional):

    <details>
      <summary>
        :heavy_plus_sign: Git clone command response output example:
      </summary>

    ```shell
    Cloning into 'crg-container'...
    remote: Enumerating objects: 234, done.
    remote: Counting objects: 100% (234/234), done.
    remote: Compressing objects: 100% (136/136), done.
    remote: Total 234 (delta 116), reused 196 (delta 82), pack-reused 0
    Receiving objects: 100% (234/234), 50.95 KiB | 815.00 KiB/s, done.
    Resolving deltas: 100% (116/116), done.
    ```

</details>

---

### Download and Extract a Release of CRG Scoreboard

[CRG ScoreBoard](https://github.com/rollerderby/scoreboard "CRG ScoreBoard GitHub Repository") GitHub repository contains the files the run the CRG Scoreboard software.  You need to download a copy of the repository files to your computer running Docker Desktop.

<details>
  <summary>
    :heavy_plus_sign: Option 1 - Download and extract the latest <strong>CRG Container</strong> release:
  </summary>

1. Navigate to the [CRG ScoreBoard Releases](https://github.com/rollerderby/scoreboard/releases "CRG ScoreBoard Releases") page.

2. Locate the `Assets` section for the latest release and click on the `.zip` file with the prefix `crg-scoreboard_` (e.g., `crg-scoreboard_v2025.6.zip`).

3. Move the downloaded `.zip` file with the prefix `crg-scoreboard_` to the extracted or cloned `crg-container` folder on your computer.

4. Extract the `.zip` file with the prefix `crg-scoreboard_` to create a folder with the prefix `crg-scoreboard_` that contains the CRG Scoreboard repository files.

</details>

<details>
  <summary>
    :heavy_plus_sign: Option 2 - Clone the repository with Git:
  </summary>

1. Open your preferred terminal application (Terminal, Git Bash, Windows PowerShell, etc.) to run Git commands.

2. Use the `git clone` command to fetch the repository files and place them within a new folder with the prefix `crg-scoreboard_`.

    <details open>
      <summary>
        :heavy_plus_sign: Git clone command:
      </summary>

    ```shell
    git clone git@github.com:rollerderby/scoreboard.git
    ```

    </details>

3. Review the `git clone` command response output (optional):

    <details>
      <summary>
        :heavy_plus_sign: Git clone command response output example:
      </summary>

    ```shell
    # git clone command response output example
    Cloning into 'scoreboard'...
    remote: Enumerating objects: 29938, done.
    remote: Counting objects: 100% (1483/1483), done.
    remote: Compressing objects: 100% (548/548), done.
    remote: Total 29938 (delta 795), reused 1357 (delta 749), pack-reused 28455
    Receiving objects: 100% (29938/29938), 109.79 MiB | 1.91 MiB/s, done.
    Resolving deltas: 100% (20295/20295), done.
    ```

    </details>

4. Confirm your file system has a folder with the prefix `crg-scoreboard_` folder within a folder named `crg-container`:

    <details open>
      <summary>
        :heavy_plus_sign: Example directory structure after downloading and extracting <strong>crg-scoreboard_v2025.6.zip</strong> in the <strong>crg-container</strong> folder:
      </summary>

      ```shell
      ├── crg-container
      │   ├── .devcontainer
      │   ├── .dockerignore
      │   ├── .git
      │   ├── .github
      │   ├── .gitignore
      │   ├── .vscode
      │   ├── Dockerfile
      │   ├── Dockerfile.dev
      │   ├── LICENSE
      │   ├── README.md
      │   ├── crg-scoreboard_v2025.6
      │   │   ├── COPYING
      │   │   ├── COPYING-AL
      │   │   ├── COPYING-GPL
      │   │   ├── LICENSES
      │   │   ├── NOTICE
      │   │   ├── README.md
      │   │   ├── blank_statsbook.xlsx
      │   │   ├── config
      │   │   ├── html
      │   │   ├── lib
      │   │   ├── logs
      │   │   ├── scoreboard-Windows.exe
      │   │   ├── scoreboard-mac.command
      │   │   ├── scoreboard.sh
      │   │   └── start.html
      │   ├── crg-scoreboard_v2025.6.zip
      │   ├── docker-compose.yml
      │   └── requirements
      ```

    </details>

> [!NOTE]
> Note that the `crg-scoreboard_v2025.6` folder is within the `crg-container` folder:

</details>

---

### Set Environment Variables

The Docker and Docker Compose configuration uses environment variables to make the CRG Scoreboard software on your computer available to the Container that will run CRG.  You need to create an environment variables file on your computer with some data that tells Docker Compose which folder on your computer will be available to the CRG Container.

1. Create a new, blank file in the `crg-container` folder named `.env`.
2. Open the `.env` file in a text editor (Notepad, TextEdit, VIM, etc.).
3. Copy the following text and paste it in the `.env` file:

    <details open>
      <summary>
        :heavy_plus_sign: Default environment variables template:
      </summary>

    ```shell
    # Local path to the 'crg-container' folder extracted from this repo
    ## Default value is the current directory
    CRG_SOURCE_VOLUME=.

    # Local path relative to CRG_SOURCE_VOLUME for the extracted CRG application
    ## Default value is CRG version 2025.6
    CRG_SOURCE_DIR=crg-scoreboard_v2025.6

    # Name of the folder to create and mount files to on the CRG container instance
    ## Default value is 'crg-container'
    CRG_MOUNT_DIR=crg-container

    # Local time zone for the CRG container instance.
    ## Defaults to UTC time if not specified.
    ## Use the time zone abbreviations found at https://en.wikipedia.org/wiki/List_of_tz_database_time_zones.
    CRG_TIME_ZONE=America/Los_Angeles
    ```

    </details>

4. Save and close the `.env` file.

## Run Instructions

### Launch the CRG Container With Docker Compose

You are ready to launch CRG in a Docker Container with Docker Compose.

1. Open your preferred terminal application (Terminal, Git Bash, Windows PowerShell, etc.).

2. Navigate to the `crg-container` folder on your computer.

3. Use Docker Compose to start the CRG Container:

    <details open >
      <summary>
        :heavy_plus_sign: Docker Compose command input:
      </summary>

    ```shell
    docker compose up
    ```

    </details>

4. Review the Docker Compose output:

    <details open>
      <summary>
        :heavy_plus_sign: Successful Docker Compose command output example:
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
      crg-container-1  | CRG ScoreBoard version v2025.6
      crg-container-1  | 2025-08-20 13:32:23.293:INFO::main: Logging initialized @482ms to org.eclipse.jetty.util.log.StdErrLog
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

---

### Review CRG Container Health Check Status (optional)

You may optionally check or monitor the status of the CRG container running in Docker Compose.

<details>
  <summary>
    :heavy_plus_sign: Overview:
  </summary>

The health check is a recurring `curl` HTTP request to the CRG web application server, and a `200 OK` response indicates the request is successful.  The health check configuration is available for review in the [`docker-compose.yml`](./docker-compose.yml "Docker Compose Health Check") file.

</details>

<details>
  <summary>
    :heavy_plus_sign: Health check command input:
  </summary>

You may manually check the status of the CRG container with the following command:

```shell
# Check the health of the most recently-created container
docker inspect -f "{{ json .State.Health }}" $(docker ps -lq)
```

</details>

<details>
  <summary>
    :heavy_plus_sign: Successful health check command output example:
  </summary>

```jsonc
// Successful health check command example output (formatted as JSON with JQ)
{
  "Status": "healthy",
  "FailingStreak": 0,
  "Log": [
    {
      "Start": "2025-08-20T12:00:00.000000000Z",
      "End": "2025-08-20T12:00:00.000000000",
      "ExitCode": 0,
      "Output": "HTTP/1.1 200 OK\r\nDate: Wed, 20 August 2025 01:50:54 GMT\r\nSet-Cookie: CRG_SCOREBOARD=node0v5ap3t21va5cq5zx2cqaekfe36.node0; Path=/; Expires=Thu, 21-Aug-2025 12:00:00 GMT; Max-Age=1296000; HttpOnly; SameSite=Lax\r\nExpires: Thu, 01 Jan 1970 00:00:00 GMT\r\nLast-Modified: Tue, 03 Oct 2023 00:56:04 GMT\r\nContent-Type: text/html;charset=utf-8\r\nAccept-Ranges: bytes\r\n"
    }
  ]
}
```

</details>

---

### Access the CRG Web Application

CRG should now be running in a Docker Container, and you may access the CRG interface with a web browser.

1. Open a [recommended web browser application](https://github.com/rollerderby/scoreboard#web-browser "CRG ScoreBoard Documentation Browser Recommendation").
2. Navigate to [http://localhost:8000](http://localhost:8000 "CRG Application Launch Page").
3. Run the CRG application in accordance with the [CRG ScoreBoard documentation](https://github.com/rollerderby/scoreboard/wiki "CRG ScoreBoard Documentation").

---

### Stop the CRG Application

You may stop the instance of CRG running in Docker Compose anytime, and your configuration and game data will persist.

1. Press `Ctrl+C` to stop CRG.

    <details open>
      <summary>
        :heavy_plus_sign: Successful stop of the CRG Container in Docker Compose output example:
      </summary>

    ```shell
    Gracefully stopping... (press Ctrl+C again to force)
    [+] Stopping 1/1
    ✔ Container crg-container-crg-container-1  Stopped                                                                     0.5s 
    canceled
    ```

    </details>


2. Stop and remove the CRG Container and Docker Network.

    <details open>
      <summary>
        :heavy_plus_sign: Docker Compose command input:
      </summary>

    ```shell
    docker compose down
    ```

    <details open>
      <summary>
        :heavy_plus_sign: Successful Docker Compose command output example:
      </summary>

    ```shell
    [+] Running 2/0
    ✔ Container crg-container-crg-container-1  Removed                                                                     0.0s 
    ✔ Network crg-container_default            Removed                                                                     0.0s 
    ```

    </details>

## FAQ

<details>
  <summary>
    :heavy_plus_sign: How do I access the CRG container from another computer or tablet over a network?
  </summary>

- A nuance of running Docker within a Container is that the IP address in the URL on the CRG Scoreboard main page (e.g., `http://172.19.0.2:8000`) is *not* the IP address of your computer; it is the private IP address of the container, and that URL is *not* directly accessible from another computer, tablet, etc.
- However, all you need to do is identify the IP address of your computer and point your web browser at that URL instead.

  1. For macOS and Linux computers, open your **Terminal** application and enter the following command:

      <details>
        <summary>
        :heavy_plus_sign: Get IP address command example:
        </summary>

      ```shell
      ifconfig | grep 'inet\s' | awk '{print $2}' | grep -v '^127\.'
      ```

      </details>
  
      <details>
        <summary>
        :heavy_plus_sign: Get IP address command output example:
        </summary>

      ```shell
      # There may be multiple IP addresses in the output
      # You may need to attempt connecting to each until one works
      192.168.100.10
      ```

      </details>


  2. For Windows computers, open your **PowerShell** application and enter the following command:

      <details>
        <summary>
        :heavy_plus_sign: Get IP address command example:
        </summary>

      ```powershell
      Get-NetIPAddress | Where-Object {
        $_.AddressFamily 'IPv4' -and
        $_.InterfaceAlias -Match '^Ethernet.+' -and
        $_.PrefixOrigin -ne 'WellKnown'
      } | Select-Object IPAddress
      ```

      </details>

      <details>
        <summary>
        :heavy_plus_sign: Get IP address command output example:
        </summary>

      ```powershell
      # There may be multiple IP addresses in the output
      # You may need to attempt connecting to each until one works
      IPAddress
      ---------
      192.168.100.10
      ```

      </details>

  3. Use your web browser to navigate to the CRG interface using the IP address of your computer in the URL.

      <details>
        <summary>
        :heavy_plus_sign: URL with your computer's IP address example:
        </summary>

      ```text
      http://192.168.100.10:8000
      ```

      </details>


</details>

## Troubleshooting

### Java exception `No X11 DISPLAY variable was set` during Container launch

> [!NOTE]
> The script that launches CRG ([`scoreboard.sh`](https://github.com/rollerderby/scoreboard/blob/dev/scoreboard.sh "scoreboard.sh Source File")) requires a modification to work correctly in a Docker Container.

The modification tells CRG to run without launching a separate Java window to display program output, which isn't supported in the Docker Container.

> [!TIP]
> Docker Compose will **automatically** run a [command](https://github.com/rcrderby/crg-container/blob/b4dc02507373b9e534d72d6df469929dcd5ebe49/docker-compose.yml#L24-L27 "Docker Compose Command") to perform the necessary modification.

<details>
  <summary>
  :heavy_plus_sign: Docker Compose Command that modifies the CRG launch script:
  </summary>

  ```shell
  /bin/bash -c "sed -i -e 's/^GUI/#\ GUI/' ./scoreboard.sh
          && ./scoreboard.sh"
  ```

</details>

> [!WARNING]
> If the modification fails, you will see an error when you [launch the Container with Docker Compose](#launch-the-crg-container-with-docker-compose "Docker Compose Launch Instructions"):

<details>
  <summary open>
  :heavy_plus_sign: CRG Java GUI error in Docker Compose example:
  </summary>

  ```shell
  crg-container-1  | Exception in thread "main" java.lang.reflect.InvocationTargetException
  crg-container-1  |  at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:119)
  crg-container-1  |  at java.base/java.lang.reflect.Method.invoke(Method.java:577)
  crg-container-1  | Caused by: java.awt.HeadlessException: 
  crg-container-1  | No X11 DISPLAY variable was set,
  crg-container-1  | but this program performed an operation which requires it.
  crg-container-1  |  at java.desktop/java.awt.GraphicsEnvironment.checkHeadless(GraphicsEnvironment.java:166)
  crg-container-1  |  at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:104)
  ```

</details>

You may manually perform the following steps to update the script and resolve the error:

1. Locate and open the folder with the prefix `crg-scoreboard_` that you created in [this step](#download-and-extract-a-release-of-crg-scoreboard "Download and Extract a Release of CRG Scoreboard").
2. Locate and open the file `scoreboard.sh` in any text editor application (Notepad, TextEdit, VIM, etc.).
3. Adjust the line of text that reads `GUI="--gui"` as follows:

    <details>
      <summary>
        :heavy_plus_sign: Prefix the line that sets the 'GUI' variable with a comment character:
      </summary>

      ```shell
      # Locate this line in scoreboard.sh
      GUI="--gui"
      ```

      ```shell
      # Add a '# ' prefix to this line so it reads
      # GUI="--gui"
      ```

    </details>

4. Save and close `scoreboard.sh`.

## Docker Compose Components

- [`Dockerfile`](./Dockerfile "Dockerfile") to create a Docker Image with JRE.
- [`docker-compose.yml`](./docker-compose.yml "CRG Container Service Definition File") to automate the deployment of CRG in a Docker Container.

## Development

- The [CRG Container](./ "CRG Container GitHub Repository") GitHub repository includes a Visual Studio Code Development Container [^6] configuration file named [`.devcontainer/devcontainer.json`](./.devcontainer/devcontainer.json "Visual Studio Code Development Container Configuration File").
  - You may open this repository in a Visual Studio Code Development Container to contribute, test, etc. using a common development environment.

## References

- [CRG ScoreBoard Git Repository](https://github.com/rollerderby/scoreboard "CRG ScoreBoard Git Repository")
- [Docker Compose documentation](https://docs.docker.com/compose "Docker Compose Documentation")

[^1]: [What is a Docker Container?](https://www.docker.com/resources/what-container "What is a Docker Container?")
[^2]: [Docker Compose Overview](https://docs.docker.com/compose "Docker Compose Overview")
[^3]: JRE: Java Runtime Environment
[^4]: OS: Operating System
[^5]: [Git download and installation instructions](https://git-scm.com "Git download an installation instructions").
[^6]: [Visual Studio Code Development Container Reference](https://code.visualstudio.com/docs/devcontainers/containers "Visual Studio Code Development Container Reference")
