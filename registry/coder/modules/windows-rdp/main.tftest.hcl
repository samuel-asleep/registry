# Test for windows-rdp module

run "test_windows_rdp_basic" {
  command = plan

  variables {
    agent_id = "test-agent-id"
  }

  # Test that the windows-rdp script is created
  assert {
    condition     = coder_script.windows-rdp.agent_id == "test-agent-id"
    error_message = "windows-rdp script agent ID should match the input variable"
  }

  assert {
    condition     = coder_script.windows-rdp.display_name == "windows-rdp"
    error_message = "windows-rdp script display name should be 'windows-rdp'"
  }

  # Test that keep-alive is enabled by default
  assert {
    condition     = length(coder_script.rdp-keepalive) == 1
    error_message = "RDP keep-alive should be enabled by default"
  }
}

run "test_keepalive_disabled" {
  command = plan

  variables {
    agent_id  = "test-agent-id"
    keepalive = false
  }

  # Test that keep-alive script is not created when disabled
  assert {
    condition     = length(coder_script.rdp-keepalive) == 0
    error_message = "RDP keep-alive should be disabled when keepalive = false"
  }
}

run "test_custom_keepalive_interval" {
  command = plan

  variables {
    agent_id           = "test-agent-id"
    keepalive          = true
    keepalive_interval = 120
  }

  # Test that keep-alive script is created with custom interval
  assert {
    condition     = length(coder_script.rdp-keepalive) == 1
    error_message = "RDP keep-alive should be enabled when keepalive = true"
  }

  assert {
    condition     = coder_script.rdp-keepalive[0].agent_id == "test-agent-id"
    error_message = "Keep-alive script agent ID should match the input variable"
  }
}

run "test_app_configuration" {
  command = plan

  variables {
    agent_id     = "test-agent-id"
    display_name = "Custom RDP"
    slug         = "custom-rdp"
    icon         = "/icon/custom.svg"
  }

  # Test that the app is created with custom configuration
  assert {
    condition     = coder_app.windows-rdp.display_name == "Custom RDP"
    error_message = "App display name should match the input variable"
  }

  assert {
    condition     = coder_app.windows-rdp.slug == "custom-rdp"
    error_message = "App slug should match the input variable"
  }

  assert {
    condition     = coder_app.windows-rdp.icon == "/icon/custom.svg"
    error_message = "App icon should match the input variable"
  }
}
