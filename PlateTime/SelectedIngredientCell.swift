//
//  SelectedIngredientCell.swift
//  PlateTime
//
//  Created by Kevin Abram on 12/24/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit

class SelectedIngredientCell: UITableViewCell {

    @IBOutlet weak var IngredientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
