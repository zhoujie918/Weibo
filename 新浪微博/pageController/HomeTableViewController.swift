//
//  HomeViewController.swift
//  新浪微博
//
//  Created by 周杰 on 15/11/3.
//  Copyright © 2015年 周杰. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    let homeTableView=UITableView()
    let arrayContent=["因为有你们 所以我不愿将就","讲真，两个人只要能在“花钱观念”、“吃菜口味”、“闲暇消遣方式”上态度一致，那就一定可以做一辈子的好朋友，或是好伴侣，基本不可能吵什么架，一起过日子也不累心。若你已经逮到了这样的人，哪怕其它方面有些小差异、小不满，也要忍让","我最近真的太容易被呛到了。。  我爸同事带他儿子来我们家玩，小家伙：“姐姐我长大后和你结婚好不好。”  我：“？？？？不好哦姐姐不喜欢小孩子。”（我爸瞪了我一眼）  “那我们以后就不要小孩子。” 惊呆","当宝宝遭遇双胞胎爸爸，哈哈哈哈哈哈怎么会有两个爸爸！！！果断一脸懵逼了","最近都不太敢吃八爪鱼。"]
    let arrayUserImages=["usrImg1","usrImg2","usrImg3","usrImg4","usrImg5"]
    let arrayUserName=["张三","李斯","网舞","麻溜","朝气"]
    let customRefreshControl=UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.dataSource=self
        homeTableView.delegate=self
        self.navigationController!.navigationBar.translucent=false
//        self.navigationItem.leftBarButtonItem=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "leftClick")
//
        self.navigationItem.leftBarButtonItem=UIBarButtonItem.item(self, action: "leftClick", image: "navigationbar_pop", highImage: "navigationbar_pop_highlighted")
        self.navigationItem.rightBarButtonItem=UIBarButtonItem.item(self, action: "rightClick", image: "navigationbar_friendsearch", highImage: "navigationbar_friendsearch_highlighted")
        customRefreshControl.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
        customRefreshControl.attributedTitle=NSAttributedString(string: "松开刷新")
        self.view.addSubview(customRefreshControl)
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUserName.count
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) ->CGFloat {
        
        let contentText=UILabel()
        contentText.text=arrayContent[indexPath.row]
        let contentString:NSString=contentText.text!
        contentText.font=UIFont.systemFontOfSize(16)
        contentText.numberOfLines=0
        let newSize=contentString.boundingRectWithSize(CGSizeMake(UIScreen.mainScreen().bounds.width-20, 300), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : contentText.font], context: nil)
    
        return newSize.height+380
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell=homeTableView.dequeueReusableCellWithIdentifier("cell") as! WeiBoTableViewCell!
        if(cell==nil){
            cell=WeiBoTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        }
        
        cell.dataLoad(arrayUserImages[indexPath.row], userName: arrayUserName[indexPath.row], contentText: arrayContent[indexPath.row])
        cell.backgroundColor=UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
        cell.opaque=true        //使用不透明视图
        return cell
    }
    
    func leftClick(){
        
    }
    func rightClick(){
        
    }
    
    func refreshData(){
        self.homeTableView.reloadData()
        self.customRefreshControl.endRefreshing()
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
