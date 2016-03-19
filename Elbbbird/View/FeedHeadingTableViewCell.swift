//
//  FeedHeadingTableViewCell.swift
//  Elbbbird
//
//  Created by Andyy Hope on 19/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

class FeedHeadingTableViewCell: UITableViewCell {

    @IBOutlet var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.setCircular()
        }
    }
    
    @IBOutlet var usernameLabel: UILabel! {
        didSet {
            usernameLabel.text = nil
        }
    }
    
    @IBOutlet var locationLabel: UILabel! {
        didSet {
            locationLabel.text = nil
        }
    }
    
    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.text = nil
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
