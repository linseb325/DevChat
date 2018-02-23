//
//  DataService.swift
//  DevChat
//
//  Created by Brennan Linse on 2/22/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: DatabaseReference {
        return Database.database().reference()
    }
    
    // Adds a user to the database.
    func saveUser(uid: String) {
        let profileInfo: [String : Any] = ["firstName" : "",
                                       "lastName" : ""]
        mainRef.child("users").child(uid).child("profileInfo").setValue(profileInfo)
    }
    
    
    
    
    
    
    
    
    
    
}
