# SwiftDisqusManager
Disqus intergration into your apps in swift
## Installation
Just drag all the files into your project (you might want to check "Copy items if needed")
## Usage
For now, only 3 functions are available but I will add more soon.
### Getting started
Firstly, you have to set your public API key, secret API key, forum shortname and redirect URL (for auth) in DisqusManager.swift:
```
let publicAPIKey = "" // Your Disqus public API key
let secretAPIKey = "" // Your Disqus secret API key
let forum = "" // Your forum shortname
let authRedirectURL = "" // Your redirect URL
```
Then, you just have to instantiate the class:
```
let disqusManager = DisqusManager()
```
### listPostsInThread
This function is based on the disqus **threads/listPosts** API. Use it like this:
```
let threadID = "1234"
disqusManager.listPostsInThread(threadID, { comments, error in
    if error != nil {
        println("\(error.localizedDescription)")
    }
    else {
        // do something with comments
    }
})
// OR USE THREAD LINK
let threadLink = "http://my-website.com/my-post/"
disqusManager.listPostsInThread(link: threadLink, { comments, error in
    if error != nil {
        println("\(error.localizedDescription)")
    }
    else {
        // do something with comments
    }
})
// OR USE THREAD IDENTIFIER
let threadIdent = "my-identifier"
disqusManager.listPostsInThread(ident: threadIdent, { comments, error in
    if error != nil {
        println("\(error.localizedDescription)")
    }
    else {
        // do something with comments
    }
})
```
### threadDetails
This function is based on the disqus **threads/details** API. Use it like this:
```
let threadLink = "http://my-website.com/my-post/"
disqusManager.threadDetails(link: threadLink, { thread, error in
    if error != nil {
        // Gestion des erreurs
        println("\(error.localizedDescription)")
        let errorAlert = UIAlertView(title: "Erreur", message: error.localizedDescription, delegate: self, cancelButtonTitle: "OK")
        errorAlert.show()
    }
    else {
        // do something with thread
    }
})
// OR USE THREAD IDENTIFIER
let threadIdent = "my-identifier"
disqusManager.threadDetails(ident: threadIdent, { thread, error in
    if error != nil {
        // Gestion des erreurs
        println("\(error.localizedDescription)")
        let errorAlert = UIAlertView(title: "Erreur", message: error.localizedDescription, delegate: self, cancelButtonTitle: "OK")
        errorAlert.show()
    }
    else {
        // do something with thread
    }
})
```
### createPost
This function is based on the disqus **posts/create** API. Use it like this:
```
let threadID = "1234"
disqusManager.createPost("Hello world!", inThread: threadID, onSuccess: {
    // Succeed !
}, onFailure: {
    // Failed !
})
// OR WITH PARENT
disqusManager.createPost("Hello world!", inThread: threadID, withParent: "2345", onSuccess: {
    // Succeed !
}, onFailure: {
    // Failed !
})
```
NB: You need to be authenticated to use this function, see *Authentication*. You can check if user is authenticated with `isUserAuthenticated()`.
### Authentication
To create a post, you need to be authenticated first.
A simple way is to have a view controller of class `DisqusComentsViewController` and protocol `DisqusComments`. Then implement `presentNewPostForm()`, which will be executed you want the user to create the post. All you have to do after is to use this function to authenticate the user and present the new post form (as you specified in `presentNewPostForm()`):
```
showNewPostForm {
    self.presentNewPostForm()
}
```
And that's it!
### Manipulate comments
Each comment is an instance of `Comment` class. `comments` is an array of `Comment` objects.
The following properties are available:
* `id: Int`
* `parent: Int?`
* `likes: Int`
* `dislikes: Int`
* `isApproved: Bool`
* `author: String`
* `message: String`
* `date: NSDate`

### Manipulate thread
Each thread is an instance of `Thread` class.
* `id: Int`
* `title: String`

## What's next ?
I will complete this project soon. The comming functions are:
* listThreadsInForum

I will also create a sample app.
If you have a special request, please contact me.
