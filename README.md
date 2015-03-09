# DisqusManager.swift
Disqus intergration into your apps in swift
## Installation
Just drag DisqusManager.swift file to your project (you might want to check "Copy items if needed")
## Usage
For now, only one function is available but I will add more soon.
### Getting started
Firstly, you have to set your public API key, secret API key and forum shortname in DisqusManager.swift:
```
let publicAPIKey = "" // Your Disqus public API key
let secretAPIKey = "" // Your Disqus secret API key
let forum = "" // Your forum shortname
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

## What's next ?
I will complete this project soon. The comming functions are:
* authenticate
* createPost
* listThreadsInForum

I will also create a sample app.
If you have a special request, please contact me.
