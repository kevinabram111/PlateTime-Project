//
//  CartValues.swift
//  PlateTime
//
//  Created by Kevin Abram on 1/11/18.
//  Copyright © 2018 Kevin Abram. All rights reserved.
//

import UIKit

class CartValues: UITableViewCell {

    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var ingredientname: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var totalcostingredient: UILabel!
    
    @IBOutlet weak var CancelButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
