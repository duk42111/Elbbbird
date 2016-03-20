//
//  FeedDetailTableViewCell.swift
//  Elbbbird
//
//  Created by Andyy Hope on 19/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

class ShotCommentTableViewCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet var usernameLabel: UILabel! {
        didSet {
            usernameLabel.text = nil
        }
    }
    
    @IBOutlet var commentLabel: UILabel! {
        didSet {
            commentLabel.text = nil
        }
    }
    
    @IBOutlet var likesLabel: UILabel! {
        didSet {
            likesLabel.text = "0"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


extension ShotCommentTableViewCell {
    static var defaultHeight: CGFloat {
        return 74
    }
}

