//
//  PersonCell.swift
//  Photog
//
//  Created by Michael Updegraff on 6/11/15.
//  Copyright (c) 2015 Michael Updegraff. All rights reserved.
//

import UIKit
import Parse
import Bolts

class PersonCell: UITableViewCell {

    @IBOutlet var followButton: UIButton?
    
    var user: PFUser?
    {
        didSet
        {
            self.configure()
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.followButton?.hidden = true
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        
        self.followButton?.hidden = true
        self.textLabel?.text = ""
        self.user = nil
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure()
    {
        
        if let constUser = user
        {
            self.textLabel?.text = constUser.username
            
            // are we following this person
            
            NetworkManager.sharedInstance.isFollowing(constUser, completionHandler: {
                (isFollowing, error) -> () in
                
                if let constError = error
                {
                    
                }
                else
                {
                   
                    if isFollowing == true
                    {
                        var image = UIImage(named: "UnfollowButton")
                        self.followButton?.setImage(image, forState: .Normal)
                    }
                    else
                    {
                        var image = UIImage(named: "FollowButton")
                        self.followButton?.setImage(image, forState: .Normal)
                    }
                    
                     self.followButton?.hidden = false
                }
                
                
            })
            
            // if so: configure the button to unfollow
            
            // else: configure the button to follow
        }
    }
}
