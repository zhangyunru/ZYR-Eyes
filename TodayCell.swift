//
//  TodayCell.swift
//  ZYREyes
//
//  Created by 张韵如 on 15/12/15.
//  Copyright © 2015年 张韵如. All rights reserved.
//

import UIKit

class TodayCell: UITableViewCell {
    var icon:UIImageView!
    var title:UILabel!
    var detail:UILabel!
    var model:TodayModel!{
        didSet{
            title.text = model.title
            detail.text = "#\(model.category)"
            self.icon.image = UIImage(data: NSData(contentsOfURL: NSURL(string: self.model.coverForDetail)!)!)
            /*
            if model.isDownload == false
            {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            let data = NSData(contentsOfURL: NSURL(string: self.model.coverForDetail)!)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
            if data != nil {
            self.icon.image = UIImage(data: data!)
            }
            })
            }
            model.isDownload = true
            print(model.title + "\(model.isDownload)")
            }
            */
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let height = KScreenWidth * 777 / 1242
        
        let view = UIView(frame: CGRectMake(0, 0, KScreenWidth, height))
        view.backgroundColor = UIColor.blackColor()
        view.alpha = 0.3
        contentView.addSubview(view)
        
        icon = UIImageView(frame: CGRectMake(0, 0, KScreenWidth, height))
        self.contentView.addSubview(icon)
        
        let y = (height - 50) / 2
        title = UILabel(frame: CGRectMake(0, y, KScreenWidth, 25))
        title.textColor = UIColor.whiteColor()
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont.boldSystemFontOfSize(16)
        contentView.addSubview(title)
        
        detail = UILabel(frame: CGRectMake(0, y + 25, KScreenWidth, 25))
        detail.textColor = UIColor.whiteColor()
        detail.textAlignment = NSTextAlignment.Center
        detail.font = UIFont.systemFontOfSize(13)
        contentView.addSubview(detail)
        }
        
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
}
