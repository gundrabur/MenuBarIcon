import SwiftUI
import Cocoa

/// Defines custom notification names used throughout the application.
/// These notifications are used to communicate between different parts of the app.
extension Notification.Name {
    /// Notification sent when the user changes the icon style in settings
    static let iconStyleChanged = Notification.Name("iconStyleChanged")
}

/// Main application entry point.
/// Configures the app's basic structure and integrates SwiftUI with AppKit functionality.
@main
struct Ethernet_Menu_IconApp: App {
    // Links the AppDelegate to the SwiftUI application lifecycle
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        // Creates the settings scene for the application
        Settings {
            SettingsView()
        }
    }
}
