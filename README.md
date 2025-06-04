# MenuBarIcon

by Christian Möller
06/04/2025

A modern macOS menu bar application template built with SwiftUI and AppKit integration.

## Features

- 🔧 Ready-to-use menu bar application structure
- ⚡️ SwiftUI integration for modern UI development
- 🎨 Custom menu bar icon support
- ⚙️ Built-in settings window with tabbed interface
- 🚀 Launch at login functionality
- 💻 AppKit and SwiftUI bridging example

## Requirements

- macOS 11.0+
- Xcode 13.0+
- Swift 5.5+

## Project Structure

```
MenuBarIcon/
├── Sources/
│   ├── AppDelegate.swift     # Core application delegate and menu bar setup
│   ├── ApplicationMenu.swift # Menu management and settings window handling
│   ├── Main.swift           # Application entry point and notification definitions
│   └── SettingsView.swift   # Settings UI implementation with SwiftUI
```

## Getting Started

1. Clone the repository
2. Open `MenuBarIcon.xcodeproj` in Xcode
3. Build and run the project (⌘R)

## Usage

The template provides a foundation for building menu bar applications with:

- Status bar item configuration
- Dropdown menu customization
- Settings window with multiple tabs
- System preferences integration

### Customizing the Menu Bar Icon

Modify the `setupStatusBarItem()` function in `AppDelegate.swift` to customize the icon:

```swift
if let image = NSImage(systemSymbolName: "YOUR_ICON_NAME", accessibilityDescription: nil) {
    image.size = NSSize(width: self.fixedImageSize, height: self.fixedImageSize)
    image.isTemplate = true
    statusBarItem.button?.image = image
}
```

### Adding Menu Items

Add new menu items in `ApplicationMenu.swift`:

```swift
let newMenuItem = NSMenuItem(
    title: "Your Item",
    action: #selector(yourAction),
    keyEquivalent: ""
)
```

## Dependencies

- [LaunchAtLogin](https://github.com/sindresorhus/LaunchAtLogin) - Adds launch at login functionality

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request
