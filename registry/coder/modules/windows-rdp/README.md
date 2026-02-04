---
display_name: RDP Web
description: RDP Server and Web Client, powered by Devolutions Gateway
icon: ../../../../.icons/desktop.svg
verified: true
tags: [windows, rdp, web, desktop]
---

# Windows RDP

Enable Remote Desktop + a web based client on Windows workspaces, powered by [devolutions-gateway](https://github.com/Devolutions/devolutions-gateway).

**Automatic Keep-Alive**: By default, this module automatically extends your workspace session timeout while an RDP connection is active, preventing unexpected shutdowns during remote desktop sessions.

```tf
# AWS example. See below for examples of using this module with other providers
module "windows_rdp" {
  count    = data.coder_workspace.me.start_count
  source   = "registry.coder.com/coder/windows-rdp/coder"
  version  = "1.4.0"
  agent_id = coder_agent.main.id
}
```

## Video

[![Video](./video-thumbnails/video-thumbnail.png)](https://github.com/coder/modules/assets/28937484/fb5f4a55-7b69-4550-ab62-301e13a4be02)

## Examples

### With AWS

```tf
module "windows_rdp" {
  count    = data.coder_workspace.me.start_count
  source   = "registry.coder.com/coder/windows-rdp/coder"
  version  = "1.4.0"
  agent_id = coder_agent.main.id
}
```

### With Google Cloud

```tf
module "windows_rdp" {
  count    = data.coder_workspace.me.start_count
  source   = "registry.coder.com/coder/windows-rdp/coder"
  version  = "1.4.0"
  agent_id = coder_agent.main.id
}
```

### With Custom Devolutions Gateway Version

```tf
module "windows_rdp" {
  count                       = data.coder_workspace.me.start_count
  source                      = "registry.coder.com/coder/windows-rdp/coder"
  version                     = "1.4.0"
  agent_id                    = coder_agent.main.id
  devolutions_gateway_version = "2025.2.2" # Specify a specific version
}
```

### With Custom Keep-Alive Settings

```tf
module "windows_rdp" {
  count              = data.coder_workspace.me.start_count
  source             = "registry.coder.com/coder/windows-rdp/coder"
  version            = "1.4.0"
  agent_id           = coder_agent.main.id
  keepalive          = true # Default: true - automatically extend session during RDP use
  keepalive_interval = 120  # Default: 60 - check for RDP connections every 120 seconds
}
```

### Disable Keep-Alive

```tf
module "windows_rdp" {
  count     = data.coder_workspace.me.start_count
  source    = "registry.coder.com/coder/windows-rdp/coder"
  version   = "1.4.0"
  agent_id  = coder_agent.main.id
  keepalive = false # Disable automatic session extension
}
```
