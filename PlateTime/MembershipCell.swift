//
//  MembershipCell.swift
//  PlateTime
//
//  Created by Kevin Abram on 1/17/18.
//  Copyright © 2018 Kevin Abram. All rights reserved.
//

import UIKit

class MembershipCell: UITableViewCell {

    @IBOutlet weak var Membershipname: UILabel!
    
    @IBOutlet weak var Membershipcost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
