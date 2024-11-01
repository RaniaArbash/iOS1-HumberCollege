//
//  ContactTableViewCell.swift
//  Week6
//
//  Created by Rania Arbash on 2024-11-01.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var phoneText: UILabel!
    
    
    @IBOutlet weak var emailText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
