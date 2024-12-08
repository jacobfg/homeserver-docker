# homeserver-docker

Home Server Docker Environment

<!-- markdownlint-disable no-inline-html -->

<p align="center">
<!--
  <a href="https://github.com/prettier/prettier#readme">
    <img alt="code style" src="https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square">
  </a>
  <a href="https://conventionalcommits.org">
    <img alt="Conventional Commits: 1.0.0" src="https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg?style=flat-square">
  </a>
-->
    <a href="https://renovatebot.com">
    <img alt="Renovate enabled" src="https://img.shields.io/badge/renovate-enabled-brightgreen.svg?style=flat-square">
    </a>
    <!-- create link action & badge -->
    <a href="https://github.com/renovatebot/github-action/actions">
      <img alt="GitHub workflow status" src="https://img.shields.io/github/actions/workflow/status/jacobfg/homeserver-docker/renovatebot.yml?style=flat-square">
    </a>
</p>

# Stacks

- [homeassistant](#homeassistant)
- [audiobookshelf](#audiobookshelf)
- [vscode-server](#vscode-server)
- [esphome](#esphome)
- [broadlink](#broadlink) ** not used
- [dockge](#dockge) ** not used

# Stacks

Docker compose Stacks

## homeassistant

[Docker Compose](homeassistant/docker-compose.yml)

## audiobookshelf

[Docker Compose](audiobookshelf/docker-compose.yml)

## vscode-server

[Docker Compose](vscode-server/docker-compose.yml)

## esphome

[Docker Compose](esphome/docker-compose.yml)

## broadlink

[Docker Compose](broadlink/docker-compose.yml) ** not used

## dockge

[Docker Compose](dockge/docker-compose.yml) ** not used

## Other Dependancies

| Name | Repo | Version |
|------|------|---------|
| Upsy Desky | github.com/tjhorner/upsy-desky | v2.0.0 |
| ESPHome | github.com/esphome/esphome | 2023.12.9 |
