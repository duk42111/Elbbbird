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

private enum Section : Int {
    case Image, Information
}

class FeedViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var isRequestingNetwork = true
    var viewModel = FeedViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestShots()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITableViewDataSource

extension FeedViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension FeedViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        guard let section = Section(rawValue: indexPath.row) else { return .min }
        
        switch section {
        case .Image:
            return 100
        case .Information:
            return 60
        }
    }
}


// MARK: - Network Requests

extension FeedViewController {
    private func requestShots() {
        DribbbleRequester.requestShots { (shots) -> Void in
            print("Hello world")
        }
    }
}