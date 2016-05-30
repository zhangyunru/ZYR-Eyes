//
//  EyesTabBarController.swift
//  ZYREyes
//
//  Created by 张韵如 on 15/12/15.
//  Copyright © 2015年 张韵如. All rights reserved.
//

import UIKit

class EyesTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

            let today = NavigationController(rootViewController:TodayTableViewController())
            today.tabBarItem.title = "每日精选"
            self.addChildViewController(today)
            
            let past = NavigationController(rootViewController:PastCollectionViewController())
            past.tabBarItem.title = "往期分类"
            self.addChildViewController(past)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
