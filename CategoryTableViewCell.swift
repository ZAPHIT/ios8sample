//
//  CategoryTableViewCell.swift
//  ios8sample
//
//  Created by Joey Serquina on 3/18/15.
//  Copyright (c) 2015 sample. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet var contentaImahe:UIImageView!
    @IBOutlet var categoryaLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
