//
//  ShotViewModel.swift
//  Elbbbird
//
//  Created by Andyy Hope on 20/03/2016.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import Foundation


class ShotViewModel {
    
    let shot: Shot
    let comments: [Comment]
    
    init(shot: Shot, comments: [Comment] = []) {
        self.shot = shot
        self.comments = comments
    }
    
    func viewModelForCommentCell(atIndexPath indexPath: NSIndexPath) ->  ShotViewCommentCellViewModel {
        let viewModel = ShotViewCommentCellViewModel(comment: comments[indexPath.row])
        return viewModel
    }
}

struct ShotViewCommentCellViewModel {
    private let comment: Comment
    let username: String
    let body: String
//    let likes: String
    
    init(comment: Comment, username: String = "", body: String = "", likes: String = "") {
        self.comment = comment
        self.username = comment.user.username
        self.body = comment.body
//        self.likes = String(comment.likes.count)
    }
    
}