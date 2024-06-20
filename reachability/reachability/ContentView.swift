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
        }
        .task {
            await networkMonitor.startMonitoring()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
