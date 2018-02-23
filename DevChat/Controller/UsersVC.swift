//
//  UsersVC.swift
//  DevChat
//
//  Created by Brennan Linse on 2/22/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import UIKit
import FirebaseDatabase

class UsersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var users = [User]()
    private var selectedUsers = [String : User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = true
        
        // Parsing Firebase data
        DataService.instance.usersRef.observeSingleEvent(of: .value) { (snapshot) in
            if let users = snapshot.value as? [String : Any] {
                for (uid, value) in users {
                    // key is the uid, value is a dictionary with keys: profileInfo, incomingMessages, outgoingMessages
                    if let userChildren = value as? [String : Any] {
                        if let profileInfo = userChildren["profileInfo"] as? [String : Any] {
                            if let firstName = profileInfo["firstName"] as? String {
                                let user = User(uid: uid, firstName: firstName)
                                self.users.append(user)
                            }
                        }
                    }
                }
            }
            self.tableView.reloadData()
            print("Brennan - users: \(self.users)")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell {
            let user = self.users[indexPath.row]
            cell.updateUI(user: user)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Selected a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckmark(true)
        let user = self.users[indexPath.row]
        self.selectedUsers[user.uid] = user
    }
    
    // Deselected a cell
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        cell.setCheckmark(false)
        let user = self.users[indexPath.row]
        self.selectedUsers[user.uid] = user
    }
    
    
    
    
    
    
}
