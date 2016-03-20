//
//  FeedViewModel.swift
//  Elbbbird
//
//  Created by Andyy Hope on 19/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation
import RxSwift
import RxViewModel

class FeedViewModel : RxViewModel {
    let shots: [Shot]
    
    init(shots: [Shot]) {
        self.shots = shots
    }
    
    func viewModelForHeadingCell(atIndexPath indexPath: NSIndexPath) -> FeedViewHeadingCellViewModel {
        let viewModel = FeedViewHeadingCellViewModel(shot: shots[indexPath.section])
        return viewModel
    }
    
    func viewModelForImageCell(atIndexPath indexPath: NSIndexPath) -> FeedViewImageCellViewModel {
        let viewModel = FeedViewImageCellViewModel(shot: shots[indexPath.section])
        return viewModel
    }
    
    func viewModelForDetailCell(atIndexPath indexPath: NSIndexPath) -> FeedViewDetailCellViewModel {
        let viewModel = FeedViewDetailCellViewModel(shot: shots[indexPath.section])
        return viewModel
    }
}

struct FeedViewHeadingCellViewModel {
    let shot: Shot
    let username: String
    let location: String
    let date: String
    let imageURL: NSURL
    
    init(shot: Shot, username: String = "", location: String = "", date: String = "", imageURL: NSURL = NSURL()) {
        
        self.shot = shot
        self.username = shot.user?.username ?? username
        self.location = shot.user?.location ?? location
        self.date = date
        self.imageURL = NSURL(string: shot.user?.avatarURL ?? "") ?? NSURL()
    }
}

struct FeedViewImageCellViewModel {
    let imageURL: NSURL
    
    init(shot: Shot, imageURL: NSURL = NSURL()) {
        self.imageURL = NSURL(string: shot.images.normalURL) ?? NSURL()
    }
}

struct FeedViewDetailCellViewModel {
    let title: String
    let description: String
    let comments: String
    let likes: String
    
    init(shot: Shot, title: String = "", description: String = "", comments: String = "0", likes: String = "0") {
        
        self.title = shot.title ?? title
        self.description = shot.description ?? description
        self.comments = String(shot.comments?.count ?? 0)
        self.likes = String(shot.likes?.count ?? 0)
        
    }
}