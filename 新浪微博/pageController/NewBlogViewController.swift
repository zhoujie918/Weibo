//
//  newBlogViewController.swift
//  新浪微博
//
//  Created by 周杰 on 16/2/14.
//  Copyright © 2016年 周杰. All rights reserved.
//

import UIKit

class NewBlogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.translucent=false
        // Do any additional setup after loading the view.
        self.view.backgroundColor=UIColor.brownColor()
        
        let btn=UIButton()
        self.view.addSubview(btn)
        btn.snp_makeConstraints { (make) -> Void in
            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }
        btn.backgroundColor=UIColor.whiteColor()
        btn.setTitle("返回", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    func back(){
        self.dismissViewControllerAnimated(false, completion: nil)
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
