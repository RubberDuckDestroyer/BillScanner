//
//  AppDelegate.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 18/02/21.
//

import Foundation
import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Initialise App Backend when app finishes launching
        print("DEBUG: profile status before init: \(Profile.default.isLoggedIn)")
        _ = Profile.initialise()
        _ = Backend.initialise()
        print("DDEBUG: Profile status after init: \(Profile.default.isLoggedIn)")
        
        return true
    }
    
}
