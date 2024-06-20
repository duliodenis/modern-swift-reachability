//
//  NetworkMonitor.swift
//  reachability
//
//  Created by Dulio Denis on 6/19/24.
//

import Foundation

@MainActor
class NetworkMonitor: ObservableObject {
    static let shared = NetworkMonitor()
    
    @Published var isConnected: Bool = false
    
    private init() { }
    
    func startMonitoring() async {
        do {
            self.isConnected = try await checkConnectivity()
        } catch {
            self.isConnected = false
        }
    }
    
    private func checkConnectivity() async throws -> Bool {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        let url = URL(string: "https://www.apple.com")!
        let (_, response) = try await session.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse {
            return httpResponse.statusCode == 200
        } else {
            return false
        }
    }
}
