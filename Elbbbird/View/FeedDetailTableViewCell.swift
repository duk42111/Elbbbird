//
//  FeedDetailTableViewCell.swift
//  Elbbbird
//
//  Created by Andyy Hope on 19/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

class FeedDetailTableViewCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text = nil
        }
    }
    
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = nil
        }
    }
    
    @IBOutlet var commentsLabel: UILabel! {
        didSet {
            commentsLabel.text = "0"
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


extension FeedDetailTableViewCell {
    static var defaultHeight: CGFloat {
        return 74
    }
}

