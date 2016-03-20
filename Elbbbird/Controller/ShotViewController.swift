//
//  ShotViewController.swift
//  Elbbbird
//
//  Created by Andyy Hope on 20/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

class ShotViewController: UIViewController {
    
    @IBOutlet var shotImageView: UIImageView!
    
    @IBOutlet var visualEffectContainerView: UIView!

    @IBOutlet var visualEffectView: UIVisualEffectView!

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    var viewModel: ShotViewModel? {
        didSet {
            if tableView != nil {
                tableView.reloadData()
                activityIndicatorView.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ShotCommentTableViewCell)
        
        requestShot()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ShotViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.comments.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ShotCommentTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        guard let viewModel = viewModel?.viewModelForCommentCell(atIndexPath: indexPath) else { return cell }
        
        cell.usernameLabel.text = viewModel.username
        cell.commentLabel.text = viewModel.body
        cell.likesLabel.text = viewModel.likes
        
        return cell
    }
}

// MARK: - Request

extension ShotViewController {
    
    
    func requestShot() {
        guard let shotID = viewModel?.shot.id else { return }
        
        DribbbleRequester.requestShot(forShotID: shotID) { [weak self] (shot) -> Void in
            guard let shot = shot else { return }
            
            self?.viewModel = ShotViewModel(shot: shot)
            self?.requestComments()
        }
    }
    
    func requestComments() {
        guard let shotID = viewModel?.shot.id else { return }
        
        DribbbleRequester.requestComments(forShotID: shotID) { [weak self] (comments) -> Void in
            guard let shot = self?.viewModel?.shot else { return }
            
            self?.viewModel = ShotViewModel(shot: shot, comments: comments)
        }
    }
}
