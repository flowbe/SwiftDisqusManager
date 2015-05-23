//
//  DisqusSettings.swift
//  SwiftDisqusManager
//
//  Created by TheFlow_ on 23/05/2015.
//
//

import Foundation

struct DisqusSettings {
    let publicAPIKey = "" // Your Disqus public API key
    let secretAPIKey = "" // Your Disqus secret API key
    let forum = "" // Your forum shortname
    let authRedirectURL = "" // Your redirect url
    
    /* The following settings are used to log in with Disqus */
    let appLabel = "" // The name of your application
    let appOrganization = "" // The name of your organization
    let appDescription = "" // A little description of your app
    let appWebsite = "" // The website of your app
    let appTermsURL = "" // Your terms URL
    let appCallbackURL = "" // Your callback URL
}
