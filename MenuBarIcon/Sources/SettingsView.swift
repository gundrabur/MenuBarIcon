import SwiftUI
import LaunchAtLogin

/// Represents the available settings tabs in the application.
/// Each tab corresponds to a different category of settings.
enum SettingsTab: String, CaseIterable {
    case general = "General"
    case about = "About"
}

/// Main settings view that provides a tabbed interface for application configuration.
/// Includes General and About sections with persistent storage using @AppStorage.
struct SettingsView: View {
    @State private var selectedTab: SettingsTab = .general
    
    var body: some View {
        VStack(spacing: 0) {
            // Tab bar at the top
            HStack {
                ForEach(SettingsTab.allCases, id: \.self) { tab in
                    Button(action: { selectedTab = tab }) {
                        VStack(spacing: 4) {
                            Image(systemName: icon(for: tab))
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(selectedTab == tab ? .accentColor : .gray)
                            Text(tab.rawValue)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(selectedTab == tab ? .accentColor : .gray)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Settings")
            .background(Color(NSColor.windowBackgroundColor).opacity(0.9))
            .cornerRadius(8)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            Divider()
                .padding(.vertical, 8)
            
            // Content area for selected tab
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    switch selectedTab {
                    case .general:
                        GeneralSettingsView()
                    case .about:
                        AboutSettingsView()
                    }
                }
                .padding(20)
            }
        }
        .frame(width: 420, height: 240)
        .background(Color(NSColor.windowBackgroundColor))
        .cornerRadius(12)
        .shadow(radius: 8)
        .padding()
    }
    
    /// Returns the icon name for each tab
    private func icon(for tab: SettingsTab) -> String {
        switch tab {
        case .general: return "gearshape"
        case .about: return "info.circle"
        }
    }
}

/// Handles general application settings including:
/// - Launch at login preference
struct GeneralSettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Launch at login toggle with aligned label and switch
            HStack(alignment: .center) {
                Text("Launch at login")
                    .font(.system(size: 14))
                    .frame(width: 120, alignment: .leading) // Fixed width for alignment
                LaunchAtLogin.Toggle("")
                    .toggleStyle(SwitchToggleStyle(tint: .red)) // Custom color for switch
            }
            .padding(.horizontal, 16)
        }
    }
}

/// Displays application information including:
/// - Version number
/// - Developer credits
/// - Links to additional resources
struct AboutSettingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("MenuBar App Template")
                .font(.system(size: 16, weight: .bold))
            
            Text("Version 1.0")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.secondary)
                .padding(.top, 4)
        }
    }
}
