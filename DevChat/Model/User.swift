//
//  User.swift
//  DevChat
//
//  Created by Brennan Linse on 2/22/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import Foundation

struct User {
    
    private var _uid: String
    private var _firstName: String
    
    init(uid: String, firstName: String) {
        _uid = uid
        _firstName = firstName
    }
    
    var uid: String {
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
}
