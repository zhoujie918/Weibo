//
//  FounViewController.swift
//  新浪微博
//
//  Created by 周杰 on 15/11/3.
//  Copyright © 2015年 周杰. All rights reserved.
//

import UIKit

class FounViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor=UIColor.greenColor()
        self.navigationController?.navigationBar.translucent=false
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
