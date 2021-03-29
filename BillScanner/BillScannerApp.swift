//
//  BillScannerApp.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 14/02/21.
//

import SwiftUI

@main
struct BillScannerApp: App {
    
    // Inject AppDelegate into SwiftUI via adaptor
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
