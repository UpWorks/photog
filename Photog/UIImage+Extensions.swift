//
//  UIImage+Extensions.swift
//  Photog
//
//  Created by Michael Updegraff on 6/18/15.
//  Copyright (c) 2015 Michael Updegraff. All rights reserved.
//

import Foundation
import UIKit

extension UIImage
{
    func resize(targetWidth: CGFloat) -> UIImage
    {
        var originalWidth = self.size.width
        
        if originalWidth <= targetWidth
        {
            return self
        }
        
        var scaleFactor = targetWidth / originalWidth
        var targetHeight = self.size.height * scaleFactor
        
        var newSize = CGSizeMake(targetWidth, targetHeight)
        UIGraphicsBeginImageContext(newSize)
        
        self.drawInRect(CGRectMake(0,0, targetWidth, targetHeight))
        
        var newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
