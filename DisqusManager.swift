//
//  DisqusManager.swift
//
//  Created by TheFlow_ on 08/03/2015.
//  Copyright (c) 2015 TheFlow_. All rights reserved.
//

import Foundation

class DisqusManager {
    let publicAPIKey = "" // Your Disqus public API key
    let secretAPIKey = "" // Your Disqus secret API key
    let forum = "" // Your forum shortname
    
    func listPostsInThread(threadID: String, completionHandler: (comments: [Comment]!, error: NSError!) -> ()) {
        var url = NSURL(string: "http://disqus.com/api/3.0/threads/listPosts.json?api_key=\(publicAPIKey)&thread=\(threadID)")! // URL du JSON
        var request = NSURLRequest(URL: url) // Création de la requête HTTP
        var queue = NSOperationQueue()  // Création de NSOperationQueue à laquelle le bloc du gestionnaire est distribué lorsque la demande complète ou échoué
        
        var comments = [Comment]()
        
        // Envoi de la requête asynchrone en utilisant NSURLConnection
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{(response: NSURLResponse!, data: NSData!, error: NSError!) ->Void in
            // Gestion des erreurs de connexion
            if error == nil {
                // Récupération du JSON
                let json = JSON(data: data)
                
                for comment in json["response"].arrayValue {
                    var dateFormat = NSDateFormatter()
                    dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    
                    let id = comment["id"].intValue
                    let parent = comment["parent"].int
                    let likes = comment["likes"].intValue
                    let dislikes = comment["dislikes"].intValue
                    let isApproved = comment["isApproved"].boolValue
                    let author = comment["author"]["name"].stringValue
                    let message = comment["raw_message"].stringValue
                    let date = dateFormat.dateFromString(comment["createdAt"].stringValue)!
                    
                    comments.append(Comment(id: id, parent: parent, likes: likes, dislikes: dislikes, isApproved: isApproved, author: author, message: message, date: date))
                }
            }
            
            completionHandler(comments: comments, error: error)
        })
    }
    
    func listPostsInThread(link threadLink: String, completionHandler: (comments: [Comment]!, error: NSError!) -> ()) {
        var url = NSURL(string: "http://disqus.com/api/3.0/threads/listPosts.json?api_key=\(publicAPIKey)&forum=\(forum)&thread:link=\(threadLink)")! // URL du JSON
        var request = NSURLRequest(URL: url) // Création de la requête HTTP
        var queue = NSOperationQueue()  // Création de NSOperationQueue à laquelle le bloc du gestionnaire est distribué lorsque la demande complète ou échoué
        
        var comments = [Comment]()
        
        // Envoi de la requête asynchrone en utilisant NSURLConnection
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{(response: NSURLResponse!, data: NSData!, error: NSError!) ->Void in
            // Gestion des erreurs de connexion
            if error == nil {
                // Récupération du JSON
                let json = JSON(data: data)
                
                for comment in json["response"].arrayValue {
                    var dateFormat = NSDateFormatter()
                    dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    
                    let id = comment["id"].intValue
                    let parent = comment["parent"].int
                    let likes = comment["likes"].intValue
                    let dislikes = comment["dislikes"].intValue
                    let isApproved = comment["isApproved"].boolValue
                    let author = comment["author"]["name"].stringValue
                    let message = comment["raw_message"].stringValue
                    let date = dateFormat.dateFromString(comment["createdAt"].stringValue)!
                    
                    comments.append(Comment(id: id, parent: parent, likes: likes, dislikes: dislikes, isApproved: isApproved, author: author, message: message, date: date))
                }
            }
            
            completionHandler(comments: comments, error: error)
        })
    }
    
    func listPostsInThread(ident threadIdent: String, completionHandler: (comments: [Comment]!, error: NSError!) -> ()) {
        var url = NSURL(string: "http://disqus.com/api/3.0/threads/listPosts.json?api_key=\(publicAPIKey)&forum=\(forum)&thread:ident=\(threadIdent)")! // URL du JSON
        var request = NSURLRequest(URL: url) // Création de la requête HTTP
        var queue = NSOperationQueue()  // Création de NSOperationQueue à laquelle le bloc du gestionnaire est distribué lorsque la demande complète ou échoué
        
        var comments = [Comment]()
        
        // Envoi de la requête asynchrone en utilisant NSURLConnection
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{(response: NSURLResponse!, data: NSData!, error: NSError!) ->Void in
            // Gestion des erreurs de connexion
            if error == nil {
                // Récupération du JSON
                let json = JSON(data: data)
                
                for comment in json["response"].arrayValue {
                    var dateFormat = NSDateFormatter()
                    dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    
                    let id = comment["id"].intValue
                    let parent = comment["parent"].int
                    let likes = comment["likes"].intValue
                    let dislikes = comment["dislikes"].intValue
                    let isApproved = comment["isApproved"].boolValue
                    let author = comment["author"]["name"].stringValue
                    let message = comment["raw_message"].stringValue
                    let date = dateFormat.dateFromString(comment["createdAt"].stringValue)!
                    
                    comments.append(Comment(id: id, parent: parent, likes: likes, dislikes: dislikes, isApproved: isApproved, author: author, message: message, date: date))
                }
            }
            
            completionHandler(comments: comments, error: error)
        })
    }
}

class Comment {
    var id: Int
    var parent: Int?
    var likes: Int
    var dislikes: Int
    var isApproved: Bool
    var author: String
    var message: String
    var date: NSDate
    
    init(id: Int, parent: Int?, likes: Int, dislikes: Int, isApproved: Bool, author: String, message: String, date: NSDate) {
        self.id = id
        self.parent = parent
        self.likes = likes
        self.dislikes = dislikes
        self.isApproved = isApproved
        self.author = author
        self.message = message
        self.date = date
    }
}