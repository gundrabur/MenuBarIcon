import SwiftUI
import Cocoa

/// The AppDelegate class handles the core functionality of the menu bar application
/// It manages the status bar item (icon in the menu bar) and handles connection status updates
class AppDelegate: NSObject, NSApplicationDelegate {
    // Singleton instance of AppDelegate that can be accessed throughout the app
    static private(set) var instance: AppDelegate!
    
    // View that handles application settings
    private var settingsView = SettingsView()
    
    // Fixed size for the menu bar icon (20x20 pixels)
    private let fixedImageSize = 20
    
    // The actual menu bar item that shows in the system status bar
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: 20)
    
    // Instance of ApplicationMenu that handles menu creation and ethernet monitoring
    let menu = ApplicationMenu()
    
    /// Called when the application finishes launching
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Set up singleton instance
        AppDelegate.instance = self
        
        // Configure the status bar item
        setupStatusBarItem()
    }
    
    /// Sets up the initial status bar item configuration
    private func setupStatusBarItem() {
        statusBarItem.button?.imagePosition = .imageOnly
        statusBarItem.button?.imageScaling = .scaleNone
        
        if let image = NSImage(systemSymbolName: "circle.fill", accessibilityDescription: nil) {
            image.size = NSSize(width: self.fixedImageSize, height: self.fixedImageSize)
            image.isTemplate = true
            statusBarItem.button?.image = image
        }
        
        statusBarItem.menu = menu.createMenu()
    }
}
