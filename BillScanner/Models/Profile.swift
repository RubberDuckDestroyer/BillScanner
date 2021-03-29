//
//  Profile.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 14/02/21.
//

import Foundation


class Profile: ObservableObject {
    var username: String = "" {
        willSet {
            objectWillChange.send()
        }
    }
//    var password: passwd
    @Published var isLoggedIn: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }
    
    
    static let `default` = Profile(username: "unauth")
    
    static func initialise() -> Profile {
        return .default
    }
    
    init(username: String) {
        self.username = username
    }
    
    func updateLogIn(status: Bool) {
        self.isLoggedIn = status
        print("DEBUG: Logged in updated to: \(status)")
    }
    
    func updateLoggedInUsername(name: String) {
        if !name.isEmpty {
            self.username = name
            print("DEBUG: Logged in updated to: \(name)")
        }
    }
    
}
