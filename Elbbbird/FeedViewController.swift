//
//  ViewController.swift
//  Elbbbird
//
//  Created by Andyy Hope on 14/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AlamofireImage


private enum Row : Int {
    case Heading, Image, Detail
    static let count: Int = 3
}

private enum Segue : String {
    case Shot
}

class FeedViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    var viewModel: FeedViewModel? {
        didSet {
            tableView.reloadData()
            activityIndicatorView.stopAnimating()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestShots()
        
        tableView.register(FeedHeadingTableViewCell)
        tableView.register(FeedImageTableViewCell)
        tableView.register(FeedDetailTableViewCell)
        
        tableView.separatorStyle = .None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITableViewDataSource

extension FeedViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return viewModel?.shots.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let row = Row(rawValue: indexPath.row) else { fatalError() }
        
        switch row {
        case .Heading:
            return headingCell(forIndexPath: indexPath)
        case .Image:
            return imageCell(forIndexPath: indexPath)
        case .Detail:
            return detailCell(forIndexPath: indexPath)
        }
    }
    
    // Cells
    
    private func headingCell(forIndexPath indexPath: NSIndexPath) -> FeedHeadingTableViewCell {
        let cell: FeedHeadingTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        guard let viewModel = viewModel?.viewModelForHeadingCell(atIndexPath: indexPath)
        else { return cell }
        
        cell.usernameLabel.text = viewModel.username
        cell.dateLabel.text = viewModel.date
        cell.locationLabel.text = viewModel.location
        cell.avatarImageView.af_setImageWithURL(viewModel.imageURL)
        
        return cell
    }
    
    private func imageCell(forIndexPath indexPath: NSIndexPath) -> FeedImageTableViewCell {
        let cell: FeedImageTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        guard let viewModel = viewModel?.viewModelForImageCell(atIndexPath: indexPath)
        else { return cell }
        
        cell.shotImageView.af_setImageWithURL(viewModel.imageURL)
        
        return cell
    }
    
    private func detailCell(forIndexPath indexPath: NSIndexPath) -> FeedDetailTableViewCell {
        let cell: FeedDetailTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        guard let viewModel = viewModel?.viewModelForDetailCell(atIndexPath: indexPath)
        else { return cell }
        
        cell.titleLabel.text = viewModel.title
        cell.descriptionLabel.text = viewModel.description
        cell.commentsLabel.text = viewModel.comments
        cell.likesLabel.text = viewModel.likes
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(Segue.Shot.rawValue, sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let
            indexPath = tableView.indexPathForSelectedRow,
            identifier = segue.identifier,
            segueIdentifier = Segue(rawValue: identifier)
        else { return }
        
        switch segueIdentifier {
        case .Shot:
            guard let
                viewModel = viewModel?.shots[indexPath.section],
                viewController = segue.destinationViewController as? ShotViewController
            else { return }
            
            let shotViewModel = ShotViewModel(shot: viewModel)
            viewController.viewModel = shotViewModel
        }
    }
}

// MARK: - UITableViewDelegate

extension FeedViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        guard let row = Row(rawValue: indexPath.row) else { return .min }
        
        switch row {
        case .Heading:
            return FeedHeadingTableViewCell.defaultHeight
        case .Image:
            return FeedImageTableViewCell.defaultHeight
        case .Detail:
            return FeedDetailTableViewCell.defaultHeight
        }
    }
}


// MARK: - Network Requests

extension FeedViewController {
    private func requestShots() {
        DribbbleRequester.requestShots { [weak self] (shots) -> Void in
            let viewModel = FeedViewModel(shots: shots)
            self?.viewModel = viewModel
        }
    }
}