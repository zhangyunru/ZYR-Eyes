//
//  TodayModel.swift
//  ZYREyes
//
//  Created by 张韵如 on 15/12/15.
//  Copyright © 2015年 张韵如. All rights reserved.
//

import UIKit

class TodayModel: NSObject {
    var category = ""
    var coverBlurred = ""
    var coverForDetail = ""
    var date = 0.0
    var myDescription = ""
    var duration = 0
    var playUrl = ""
    var title = ""
    var webUrl = ""
    var isDownload = false
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        if key == "description" {
            setValue(value, forKey: "myDescription")
        }
    }
}
