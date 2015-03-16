//
//  DisqusAuthenticateViewController.swift
//  SwiftDisqusManager
//
//  Created by TheFlow_ on 10/03/2015.
//  Copyright (c) 2015 TheFlow_. All rights reserved.
//

import UIKit

class DisqusAuthenticateViewController: UIViewController, UIWebViewDelegate, UIAlertViewDelegate {
    
    var webView: UIWebView!
    let disqusManager = DisqusManager()
    let authorizationURL = NSURL(string: "https://disqus.com/api/oauth/2.0/authorize/?scope=read,write&response_type=api_key&redirect_uri=\(DisqusManager().authRedirectURL)")!
    var onSuccess: (() -> ())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Connexion à Disqus"
        
        webView = UIWebView(frame: self.view.bounds)
        webView.delegate = self
        self.view.addSubview(webView)
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "cancel")
        self.navigationItem.leftBarButtonItem = cancelButton
        
        webView.loadRequest(NSURLRequest(URL: authorizationURL))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func paramsFromQueryString(queryString: String) -> [String: String] {
        var returnDict = [String: String]()
        for pair in queryString.componentsSeparatedByString("&") {
            let keyAndValue = pair.componentsSeparatedByString("=")
            if keyAndValue.count == 2 {
                let key = keyAndValue[0] as String
                let value = keyAndValue[1] as String
                
                returnDict[key] = value
            }
        }
        
        return returnDict
    }
    
    func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func complete() {
        self.dismissViewControllerAnimated(true, completion: onSuccess)
    }
    
    // MARK: - Web view delegate
    func webViewDidStartLoad(webView: UIWebView) {
        // Afficher l'icône de chargement dans la barre de status
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        // Masquer l'icône de chargement dans la barre de status
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if request.URL.host == NSURL(string: disqusManager.authRedirectURL)!.host {
            let params = self.paramsFromQueryString(request.URL.query!)
            if let code = params["code"] {
                disqusManager.authenticate(code, onSuccess: {
                    self.complete()
                    }, onFailure: {
                        let errorAlert = UIAlertView(title: "Erreur", message: "Une erreur s'est produite lors de la connexion à Disqus. Merci de réessayer plus tard.", delegate: self, cancelButtonTitle: "OK")
                        errorAlert.delegate = self
                        dispatch_async(dispatch_get_main_queue(), {
                            errorAlert.show()
                        })
                })
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false // Masquer l'icône de chargement dans la barre de status
                return false
            }
        }
        
        return true
    }
    
    // MARK: - Alert view delegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == alertView.cancelButtonIndex {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
