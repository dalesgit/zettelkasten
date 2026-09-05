---
_organized: true
---
This is where you configure SilverBullet to your liking. See [[^Library/Std/Config]] for a full list of configuration options.

```space-lua
config.set("plugs", {
  -- Add your plugs here (https://silverbullet.md/Plugs)
  -- Then run the `Plugs: Update` command to update them
})
```

```space-lua
-- managed-by: configuration-manager
config.set("github.name", "Dale Hathaway")
config.set("github.email", "dhath12@gmail.com")
command.update { name = "Open Command Palette", key = "Alt-/" }
```