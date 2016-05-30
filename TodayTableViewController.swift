//
//  TodayTableViewController.swift
//  ZYREyes
//
//  Created by 张韵如 on 15/12/15.
//  Copyright © 2015年 张韵如. All rights reserved.
//

import UIKit

class TodayTableViewController: UITableViewController {
    
    var modelArray:NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

            // Swift中没有宏定义
            self.tableView.rowHeight = KScreenWidth * 777 / 1242
            // Swift中如何使用枚举值
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
            
            self.tableView.registerClass(TodayCell.self, forCellReuseIdentifier: "today")
            
            // 数据请求
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            formatter.timeZone = NSTimeZone.systemTimeZone()
            let date = formatter.stringFromDate(NSDate())
            let url = NSURL(string: "http://baobab.wandoujia.com/api/v1/feed?date=\(date)&num=10")
            print(url)
            NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
                let dic = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let dailyList = dic["dailyList"] as! NSArray
                for dailyListDic in dailyList
                {
                    let videoList = dailyListDic["videoList"] as! NSArray
                    let subArray = NSMutableArray()
                    for videoListDic in videoList
                    {
                        let model = TodayModel()
                        model.setValuesForKeysWithDictionary(videoListDic as! [String : AnyObject])
                        subArray.addObject(model)
                    }
                    self.modelArray.addObject(subArray)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                    })
                }
                }.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.modelArray.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.modelArray[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("today", forIndexPath: indexPath) as! TodayCell

        let array = self.modelArray[indexPath.section] as! NSArray
        let model = array[indexPath.row] as! TodayModel
        
        cell.model = model


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
