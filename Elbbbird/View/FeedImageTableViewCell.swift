//
//  FeedImageTableViewCell.swift
//  Elbbbird
//
//  Created by Andyy Hope on 19/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

class FeedImageTableViewCell: UITableViewCell, NibLoadableView {

    @IBOutlet var shotImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension FeedImageTableViewCell {
    static var defaultHeight : CGFloat {
        return UIScreen.mainScreen().bounds.width
    }
}