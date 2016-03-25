//
//  Item.swift
//  新浪微博
//
//  Created by 周杰 on 15/11/9.
//  Copyright © 2015年 周杰. All rights reserved.
//

import UIKit

extension UIBarButtonItem //为UIBarButtonItem扩展一个方法
{
    static func item(target:AnyObject,action:Selector,image:String,highImage:String)->UIBarButtonItem {
        let item=UIButton()
        
        
        item.setBackgroundImage(UIImage(named: image), forState: UIControlState.Normal)
        item.setBackgroundImage(UIImage(named: highImage), forState: UIControlState.Highlighted)
        
        
        item.frame.size=item.currentBackgroundImage!.size
        item.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return UIBarButtonItem(customView: item)
    }
}

//extension UITabBarItem
//{
//    static func item(target:AnyObject,action:Selector,image:String,highImage:String)->UITabBarItem{
//        let item=UIButton()
//        item.setImage(UIImage(named: image), forState: UIControlState.Normal)
//        item.setImage(UIImage(named: highImage), forState: UIControlState.Highlighted)
//        item.frame.size=item.currentImage!.size
//        item.addTarget(self, action: action, forControlEvents: UIControlEvents.TouchUpInside)
//        return UITabBarItem()
//    }
//}
