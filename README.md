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

1. Download and extract a [CRG ScoreBoard release](https://github.com/rollerderby/scoreboard/releases "CRG ScoreBoard Releases"):
2. Install Docker Desktop:

    <details>
    <summary>Docker Desktop System Requirements</summary>

    - [Windows](https://docs.docker.com/desktop/install/windows-install "Docker Desktop for Windows System Requirements")
    - [macOS](https://docs.docker.com/desktop/install/mac-install "Docker Desktop for macOS System Requirements")
    - [Linux](https://docs.docker.com/desktop/install/linux-install "Docker Desktop for Linux System Requirements")

    </details>

3. Check the status of your Docker runtime:

    <details>
    <summary>Docker Engine validation command input</summary>

    ```shell
    docker --version
    ```

    </details>
    <details>
    <summary>Docker Engine validation command sample output</summary>

    ```text
    Docker version 26.0.0, build 2ae903e
    ```

    </details>

4. Set up environment variables.
5. Run Docker Compose

## FAQ

## Development

TODO
