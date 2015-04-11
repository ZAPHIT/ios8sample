//
//  NestedCollectionViewCell.swift
//  ios8sample
//
//  Created by Joey Serquina on 3/20/15.
//  Copyright (c) 2015 sample. All rights reserved.
//

import UIKit

class NestedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cellimage:UIImageView!
    
    required init(coder aDecoder:NSCoder)
    {
        super.init(coder: aDecoder)
    }

    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        cellimage = UIImageView(frame: CGRect(x:0, y:0, width: frame.size.width, height: frame.size.height*2/3))
        cellimage.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(cellimage)
        
        
    }
    
}
