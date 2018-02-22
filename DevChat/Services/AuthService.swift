//
//  AuthService.swift
//  DevChat
//
//  Created by Brennan Linse on 2/19/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errorMessage: String?, _ data: Any?) -> Void

class AuthService {
    
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func signIn(email: String, password: String, onComplete: Completion?) {
        // Login stuff
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                // There was a sign-in error!
                if let errorCode = AuthErrorCode(rawValue: (error! as NSError).code) {
                    if errorCode == AuthErrorCode.userNotFound {
                        // The sign-in error was: This user doesn't exist yet.
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.handleFirebaseAuthError(error: error! as NSError, onComplete: onComplete)
                            } else {
                                // No error creating a new user.
                                if user?.uid != nil {
                                    // Sign in for the newly created user.
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            self.handleFirebaseAuthError(error: error! as NSError, onComplete: onComplete)
                                        } else {
                                            // Successfully signed the new user in.
                                            onComplete?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    } else {
                        // The sign-in error was something other than the user not existing yet.
                        self.handleFirebaseAuthError(error: error! as NSError, onComplete: onComplete)
                    }
                } else {
                    print("Brennan - Could not get the error code for a sign-in error for some reason...")
                    self.handleFirebaseAuthError(error: error! as NSError, onComplete: onComplete)
                }
            } else {
                // Successfully signed in.
                onComplete?(nil, user)
            }
        }
    }
    
    func handleFirebaseAuthError(error: NSError, onComplete: Completion?) {
        print("Brennan - Handling Auth error with description: \(error.localizedDescription)")
        guard let errorCode = AuthErrorCode(rawValue: error.code) else {
            // Could not convert error.code to an AuthErrorCode
            return
        }
        
        switch errorCode {
        case .invalidEmail:
            // E-mail doesn't make sense
            onComplete?("Invalid e-mail address.", nil)
        case .wrongPassword:
            // User tried to login with an incorrect password
            onComplete?("Invalid password", nil)
        case .emailAlreadyInUse, .accountExistsWithDifferentCredential:
            onComplete?("Could not create account: E-mail already in use!", nil)
        default:
            // All other Auth error types
            onComplete?("There was some kind of error authenticating. Please try again.", nil)
        }
    }
    
    
    
    
    
    
}
