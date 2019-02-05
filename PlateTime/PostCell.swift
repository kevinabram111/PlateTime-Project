//
//  PostCell.swift
//  PlateTime
//
//  Created by Kevin Abram on 12/4/17.
//  Copyright © 2017 Kevin Abram. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var PostImage: UIImageView!
    @IBOutlet weak var PostDescription: UITextView!
    @IBOutlet weak var ProfilePic: UIImageView!
    @IBOutlet weak var PName: UILabel!
    @IBOutlet weak var LikedBy: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
