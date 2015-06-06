//
//  UIViewController+Extensions.swift
//  Photog
//
//  Created by Michael Updegraff on 6/6/15.
//  Copyright (c) 2015 Michael Updegraff. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController
{
    func showAlert(message: String)
    {
        self.showAlert("Uh Oh!", message: message)
    }
    
    func showAlert(title: String, message: String)
    {
        var alertController = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}