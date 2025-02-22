//
//  StudentTableViewCell.swift
//  week6
//
//  Created by Rania Arbash on 2025-02-21.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var studentImage: UIImageView!
    
    @IBOutlet weak var studentName: UILabel!
    
    
    @IBOutlet weak var studentEmail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
