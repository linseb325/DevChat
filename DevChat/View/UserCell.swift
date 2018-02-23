//
//  UserCell.swift
//  DevChat
//
//  Created by Brennan Linse on 2/22/18.
//  Copyright © 2018 Brennan Linse. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCheckmark(false)
    }
    
    func setCheckmark(_ selected: Bool) {
        let imageString = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageString))
    }
    
    func updateUI(user: User) {
        firstNameLabel.text = user.firstName
    }

}
