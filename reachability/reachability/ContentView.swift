//
//  ContentView.swift
//  reachability
//
//  Created by Dulio Denis on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkMonitor = NetworkMonitor.shared
    
    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                Text("Connected to the network")
                    .foregroundColor(.green)
            } else {
                Text("No network connection")
                    .foregroundColor(.red)
            }
            
            Text("Connection Type: \(connectionTypeString)")
                .padding()
        }
        .onAppear {
            networkMonitor.startMonitoring()
        }
    }
    
    private var connectionTypeString: String {
        switch networkMonitor.connectionType {
        case .wifi:
            return "WiFi"
        case .cellular:
            return "Cellular"
        case .ethernet:
            return "Ethernet"
        case .unknown:
            return "Unknown"
        }
    }
}

#Preview {
    ContentView()
}
