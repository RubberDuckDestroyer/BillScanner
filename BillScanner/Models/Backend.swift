//
//  Backend.swift
//  BillScanner
//
//  Created by Hitarth Asrani on 18/02/21.
//

import Foundation
import Amplify
import AmplifyPlugins
import SwiftUI

class Backend {
    static let shared = Backend()
    @State var profile: Profile = Profile.default
    
    
    static func initialise() -> Backend {
        return .shared
    }
    
    private init() {
        do {
            
            
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            print("Initialised Amplify")
            
            _ = Amplify.Hub.listen(to: .auth) { payload in
                switch payload.eventName {
                case HubPayload.EventName.Auth.signedIn:
                    print("User signed in!")
                    self.updateUserData(withSignInStatus: true)
                    
                case HubPayload.EventName.Auth.signedOut:
                    print("User signed out")
                    self.updateUserData(withSignInStatus: false)
                
                case HubPayload.EventName.Auth.sessionExpired:
                    print("Session Expired")
                    self.updateUserData(withSignInStatus: false)
                
//                case HubPayload.EventName.Auth.signInAPI:
//                    print("Update Password")
//                    Amplify.Auth.confirmSignIn(challengeResponse: "Admin1234") { res in
//                        switch res {
//                        case .success(_):
//                            print("Signed In")
//                            self.updateUserData(withSignInStatus: true)
//                        case .failure(let err):
//                            print(err)
//                        }
//                    }
//                    
                default:
                    print("** HUB PAYLOAD ** \(payload)")
                    break
                }
            }
            
            _ = Amplify.Auth.fetchAuthSession { result in
                do {
                    let session = try result.get()
                    print(session as Any)
                    self.updateUserData(withSignInStatus: session.isSignedIn)
                } catch {
                    print("Cannot fetch auth session - \(error)")
                }
            }
        } catch {
            print("Amplify failed to load \(error)")
            fatalError("Could not load resources")
        }
    }
    
    public func signIn(email: String, password: String) -> Bool {
        
        var loggedIn = false
        _ = Amplify.Auth.signIn(username: email, password: password, options: .none) { amplifyOpr in
            switch amplifyOpr {
            case .failure(let err):
                print(err)
                print("Error while logging in")
            case .success(let res) :
                print(res)
                print(res.isSignedIn)
                print("Login Successful")
                loggedIn = true
            }
            
        }
        
        return loggedIn
    }
    
    public func signOut() {
        _ = Amplify.Auth.signOut() { res in
            switch res {
            case .success(_):
                print("Sign out successfull!")
            case .failure(let err):
                print(err)
                print("Error while signing out")
            }
        }
    }
    
    func updateUserData(withSignInStatus status: Bool) {
        DispatchQueue.main.async() {
            self.profile.updateLogIn(status: status)

            // If user is signed in update the username
            if let name = Amplify.Auth.getCurrentUser()?.username, status == true {
                self.profile.updateLoggedInUsername(name: name)
            }
//            DataModel.updateProfileStatus(status: status)
        }
    }
    
    
}
