import Cocoa
import SwiftUI

/// Manages the application's menu and monitors ethernet connection status.
/// This class is responsible for:
/// - Creating and managing the status bar menu
/// - Monitoring ethernet connection state
/// - Handling speed monitoring and display
/// - Managing application settings window
class ApplicationMenu: NSObject, NSWindowDelegate {
    // Main menu instance
    let menu = NSMenu()
    
    // Menu items
    let settingsItem = NSMenuItem(
        title: "Settings",
        action: #selector(openSettings),
        keyEquivalent: "s"
    )
    let quitApplicationItem = NSMenuItem(
        title: "Quit Application",
        action: #selector(quitApplication),
        keyEquivalent: "q"
    )
    
    // Settings window reference
    var settingsPanel: NSPanel?
    
    override init() {
        super.init()
        setupMenuItems()
    }
    
    /// Configures menu items with their targets and actions.
    /// This method is called during initialization to set up all menu item behaviors.
    private func setupMenuItems() {
        settingsItem.target = self
        quitApplicationItem.target = self
    }
    
    /// Creates and returns the configured menu
    func createMenu() -> NSMenu {
        menu.removeAllItems() // Clean up before adding items
        
        menu.addItem(settingsItem)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(quitApplicationItem)
        
        return menu
    }
    
    /// Quits the application
    @objc func quitApplication() {
        NSApplication.shared.terminate(self)
    }
    
    /// Opens the settings panel
    @objc func openSettings() {
        NSApplication.shared.activate(ignoringOtherApps: true)
        
        if settingsPanel == nil {
            createSettingsPanel()
        }
        
        settingsPanel?.makeKeyAndOrderFront(nil)
        settingsPanel?.orderFrontRegardless()
    }
    
    /// Creates the settings panel
    private func createSettingsPanel() {
        let panel = NSPanel(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 200),
            styleMask: [.titled, .closable],
            backing: .buffered,
            defer: false
        )
        
        panel.center()
        panel.setFrameAutosaveName("Settings")
        panel.contentView = NSHostingView(rootView: SettingsView())
        panel.delegate = self
        panel.isFloatingPanel = true
        panel.level = .floating
        
        self.settingsPanel = panel
    }
}
