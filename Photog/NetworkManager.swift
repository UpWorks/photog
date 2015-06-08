//
//  NetworkManager.swift
//  Photog
//
//  Created by Michael Updegraff on 6/7/15.
//  Copyright (c) 2015 Michael Updegraff. All rights reserved.
//

import Foundation
import Parse
import Bolts

public class NetworkManager
{
    public class var sharedInstance: NetworkManager
    {
        struct Singleton
        {
            static let instance = NetworkManager()
        }
        
        return Singleton.instance
    }
    
    func follow(user: PFUser!, completionHandler:(error: NSError?) -> ())
    {
        var relation = PFUser.currentUser()?.relationForKey("following")
        relation?.addObject(user)
        PFUser.currentUser()?.saveInBackgroundWithBlock {
            (success, error) -> Void in
            
            completionHandler(error: error)
        }
    }
    
    func fetchFeed(completionHandler: (objects: [AnyObject]?, error: NSError?) -> ())
    {
        var relation = PFUser.currentUser()!.relationForKey("following")
        var query = relation.query()
        query?.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
         
            if let constError = error
            {
                println("error fetching following")
                completionHandler(objects: nil, error: constError)
            }
            else
            {
                println("success fetching following \(objects)")
                
                var postQuery = PFQuery(className: "Post")
                postQuery.whereKey("User", containedIn: objects!)
                postQuery.orderByDescending("createdAt")
                postQuery.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]?, error: NSError?) -> Void in
                    
                    //completionHandler(objects: objects, error: error)
                    println("success fetching feed posts \(objects)")
                    
                })
            }
            
        }
    }
    
}
