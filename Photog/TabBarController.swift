//
//  TabBarController.swift
//  Photog
//
//  Created by Michael Updegraff on 6/6/15.
//  Copyright (c) 2015 Michael Updegraff. All rights reserved.
//

import UIKit
import Parse
import Bolts

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var feedViewController = FeedViewController(nibName: "FeedViewController", bundle: nil)
        
        var profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profileViewController.user = PFUser.currentUser()
        
        var searchPeopleViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
        
        var cameraViewController = UIViewController()
        cameraViewController.view.backgroundColor = UIColor.purpleColor()

        var viewControllers = [feedViewController,profileViewController, searchPeopleViewController,cameraViewController]
        self.setViewControllers(viewControllers, animated: true)
        
        var imagesNames = ["FeedIcon","ProfileIcon","SearchIcon","CameraIcon"]
        
        let tabItems = tabBar.items as! [UITabBarItem]
        for (index, value) in enumerate(tabItems)
        {
            var imageName = imagesNames[index]
            value.image = UIImage(named: imageName)
            value.imageInsets = UIEdgeInsetsMake(5.0, 0, -5.0, 0)
        }
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.navigationItem.hidesBackButton = true
        self.tabBar.translucent = false
        
        self.delegate = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .Done, target: self.delegate, action: "didTapSignOut:")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "Photog"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didTapSignOut(sender: AnyObject)
    {
        PFUser.logOut()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool
    {
        
        var cameraViewController = self.viewControllers![3] as! UIViewController
        if viewController == cameraViewController
        {
            showCamera()
            return false
        }
        return true
    }
    
    func showCamera()
    {
        println("Show Camera!")
    }
}
