//
//  DisqusManager.swift
//  SwiftDisqusManager
//
//  Created by TheFlow_ on 08/03/2015.
//  Copyright (c) 2015 TheFlow_. All rights reserved.
//

import Foundation

class DisqusManager {
    let publicAPIKey = "" // Your Disqus public API key
    let secretAPIKey = "" // Your Disqus secret API key
    let forum = "" // Your forum shortname
    let authRedirectURL = "" // Your redirect url
    
    private var isAuthenticated: Bool? {
        get {
            return  NSUserDefaults.standardUserDefaults().objectForKey("SwiftDisqusIsAuthenticated") as? Bool
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "SwiftDisqusIsAuthenticated")
        }
    }
    private var userID: Int? {
        get {
            return  NSUserDefaults.standardUserDefaults().objectForKey("SwiftDisqusUserID") as? Int
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "SwiftDisqusUserID")
        }
    }
    private var userSecretAPIKey: String? {
        get {
            return  NSUserDefaults.standardUserDefaults().objectForKey("SwiftDisqusUserSecretAPIKey") as? String
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "SwiftDisqusUserSecretAPIKey")
        }
    }
    private var userAccessToken: String? {
        get {
            return  NSUserDefaults.standardUserDefaults().objectForKey("SwiftDisqusUserAccessToken") as? String
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "SwiftDisqusUserAccessToken")
        }
    }
    
    init() {
        if isAuthenticated == nil {
            isAuthenticated = false
        }
    }
    
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
                    let avatar = "http:" + comment["author"]["avatar"]["cache"].stringValue
                    let message = comment["raw_message"].stringValue
                    let date = dateFormat.dateFromString(comment["createdAt"].stringValue)!
                    
                    comments.append(Comment(id: id, parent: parent, likes: likes, dislikes: dislikes, isApproved: isApproved, author: author, avatar: avatar, message: message, date: date))
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
                    let avatar = "http:" + comment["author"]["avatar"]["cache"].stringValue
                    let message = comment["raw_message"].stringValue
                    let date = dateFormat.dateFromString(comment["createdAt"].stringValue)!
                    
                    comments.append(Comment(id: id, parent: parent, likes: likes, dislikes: dislikes, isApproved: isApproved, author: author, avatar: avatar, message: message, date: date))
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
                    let avatar = "http:" + comment["author"]["avatar"]["cache"].stringValue
                    let message = comment["raw_message"].stringValue
                    let date = dateFormat.dateFromString(comment["createdAt"].stringValue)!
                    
                    comments.append(Comment(id: id, parent: parent, likes: likes, dislikes: dislikes, isApproved: isApproved, author: author, avatar: avatar, message: message, date: date))
                }
            }
            
            completionHandler(comments: comments, error: error)
        })
    }
    
    func threadDetails(link threadLink: String, completionHandler: (thread: Thread!, error: NSError!) -> ()) {
        var url = NSURL(string: "https://disqus.com/api/3.0/threads/details.json?api_key=\(publicAPIKey)&forum=\(forum)&thread:link=\(threadLink)")! // URL du JSON
        var request = NSURLRequest(URL: url) // Création de la requête HTTP
        var queue = NSOperationQueue()  // Création de NSOperationQueue à laquelle le bloc du gestionnaire est distribué lorsque la demande complète ou échoué
        
        // Envoi de la requête asynchrone en utilisant NSURLConnection
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{(response: NSURLResponse!, data: NSData!, error: NSError!) ->Void in
            var thread: Thread?
            // Gestion des erreurs de connexion
            if error == nil {
                // Récupération du JSON
                let json = JSON(data: data)
                
                if json["code"].int == 0 {
                    let id = json["response"]["id"].intValue
                    let title = json["response"]["title"].stringValue
                    
                    thread = Thread(id: id, title: title)
                }
            }
            
            completionHandler(thread: thread, error: error)
        })
    }
    
    func threadDetails(ident threadIdent: String, completionHandler: (thread: Thread!, error: NSError!) -> ()) {
        var url = NSURL(string: "https://disqus.com/api/3.0/threads/details.json?api_key=\(publicAPIKey)&forum=\(forum)&thread:ident=\(threadIdent)")! // URL du JSON
        var request = NSURLRequest(URL: url) // Création de la requête HTTP
        var queue = NSOperationQueue()  // Création de NSOperationQueue à laquelle le bloc du gestionnaire est distribué lorsque la demande complète ou échoué
        
        // Envoi de la requête asynchrone en utilisant NSURLConnection
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{(response: NSURLResponse!, data: NSData!, error: NSError!) ->Void in
            var thread: Thread?
            // Gestion des erreurs de connexion
            if error == nil {
                // Récupération du JSON
                let json = JSON(data: data)
                
                if json["code"].int == 0 {
                    let id = json["response"]["id"].intValue
                    let title = json["response"]["title"].stringValue
                    
                    thread = Thread(id: id, title: title)
                }
            }
            
            completionHandler(thread: thread, error: error)
        })
    }
    
    func authenticate(code: String, onSuccess: () -> (), onFailure: () -> ()) {
        let url = NSURL(string: "https://disqus.com/api/oauth/2.0/api_key/")!
        let request = NSMutableURLRequest(URL: url)
        let queue = NSOperationQueue()
        let params = "grant_type=api_key&redirect_uri=\(authRedirectURL)&code=\(code)&application[label]=Frenchmac&application[description]=frenchmac&application[website]=http://www.frenchmac.com/&application[organization]=Frenchmac&application[terms_url]=http://www.frenchmac.com/terms&application[callback_url]=http://www.frenchmac.com/callback"
        request.HTTPBody = params.dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPMethod = "POST"
        
        // Envoi de la requête asynchrone en utilisant NSURLConnection
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{(response: NSURLResponse!, data: NSData!, error: NSError!) ->Void in
            // Gestion des erreurs de connexion
            if error == nil {
                // Récupération du JSON
                let json = JSON(data: data)
                
                if json["error"].string == nil {
                    // Connexion réussie !
                    self.userID = json["user_id"].intValue
                    self.userSecretAPIKey = json["api_secret"].stringValue
                    self.userAccessToken = json["access_token"].stringValue
                    
                    self.isAuthenticated = true
                    onSuccess()
                }
                else {
                    let errorDesc = json["error_description"].stringValue
                    println("\(errorDesc)")
                    onFailure()
                }
                
                println("\(json)")
            }
            else {
                println("\(error.localizedDescription)")
                onFailure()
            }
        })
    }
    
    func isUserAuthenticated() -> Bool {
        return isAuthenticated!
    }
    
    func createPost(message: String, inThread threadID: String?, withParent parent: String? = nil, onSuccess: () -> (), onFailure: () -> ()) {
        if isUserAuthenticated() {
            let url = NSURL(string: "https://disqus.com/api/3.0/posts/create.json")!
            let request = NSMutableURLRequest(URL: url)
            let queue = NSOperationQueue()
            let message = message.stringByReplacingOccurrencesOfString(" ", withString: "+", options: nil, range: nil).stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            var params = "api_secret=\(userSecretAPIKey!)&message=\(message)"
            if let threadID = threadID {
                params += "&thread=\(threadID)"
            }
            if let parent = parent {
                params += "&parent=\(parent)"
            }
            params += "&access_token=\(userAccessToken!)"
            request.HTTPBody = params.dataUsingEncoding(NSUTF8StringEncoding)
            request.HTTPMethod = "POST"
            
            // Envoi de la requête asynchrone en utilisant NSURLConnection
            NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{(response: NSURLResponse!, data: NSData!, error: NSError!) ->Void in
                // Gestion des erreurs de connexion
                if error == nil {
                    // Récupération du JSON
                    let json = JSON(data: data)
                    
                    if json["code"].int == 0 {
                        // Envoyé
                        
                        onSuccess()
                    }
                    else {
                        let response = json["response"].stringValue
                        println("\(response)")
                        onFailure()
                    }
                }
                else {
                    println("\(error.localizedDescription)")
                    onFailure()
                }
            })
        }
        else {
            onFailure()
        }
    }
}

class Comment {
    var id: Int
    var parent: Int?
    var likes: Int
    var dislikes: Int
    var isApproved: Bool
    var author: String
    var avatar: String
    var message: String
    var date: NSDate
    
    init(id: Int, parent: Int?, likes: Int, dislikes: Int, isApproved: Bool, author: String, avatar: String, message: String, date: NSDate) {
        self.id = id
        self.parent = parent
        self.likes = likes
        self.dislikes = dislikes
        self.isApproved = isApproved
        self.author = author
        self.avatar = avatar
        self.message = message
        self.date = date
    }
}

class Thread {
    var id: Int
    var title: String
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
