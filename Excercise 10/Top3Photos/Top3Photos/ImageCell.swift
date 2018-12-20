//
//  ImageCell.swift
//  Top3Photos
//
//  Created by Dimitar Stoyanov on 20.12.18.
//  Copyright © 2018 Dimitar Stoyanov. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet weak var tableViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
