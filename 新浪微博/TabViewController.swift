//
//  tabViewController.swift
//  新浪微博
//
//  Created by 周杰 on 15/11/4.
//  Copyright © 2015年 周杰. All rights reserved.
//  标签控制器

import UIKit

class TabViewController: UITabBarController {
    let home=HomeViewController()
    let mess=MessViewController()
    let blog=NewBlogViewController()
    let foun=FounViewController()
    let my=MyViewController()
    
    let btnBlog=UIButton()
    let clearBtn=UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
//根控制器添加子控制器，并添加子控制器属性
        self.tabBar.translucent=false
        self.addChildViewController(setChildVC(home, title: "首页", image: "tabbar_home", selectedImage: "tabbar_home_highlighted"))
        self.addChildViewController(setChildVC(mess, title: "消息", image: "tabbar_message_center", selectedImage: "tabbar_message_center_highlighted"))
//        self.addChildViewController(setChildVC(blog, title: "", image: "blog.jpg", selectedImage: "blog_highLighted"))
        self.addChildViewController(blog)
        self.addChildViewController(setChildVC(foun, title: "搜索", image: "tabbar_discover", selectedImage: "tabbar_discover_highlighted"))
        self.addChildViewController(setChildVC(my, title: "我的", image: "tabbar_profile", selectedImage: "tabbar_profile_highlighted"))
        
        self.view.addSubview(btnBlog)
        btnBlog.setImage(UIImage(named: "blog"), forState: UIControlState.Normal)
        btnBlog.frame.size=btnBlog.currentImage!.size
        btnBlog.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).inset(5)
        }
        
        self.view.addSubview(clearBtn)
        clearBtn.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(80)
            make.height.equalTo(45)
            make.centerX.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).inset(5)
        }
        clearBtn.addTarget(self, action: "releaseBlog", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
//设定子视图控制器的各种属性
    func setChildVC(childVC:UIViewController,title:String,image:String,selectedImage:String) -> UINavigationController {
        childVC.title=title
        childVC.tabBarItem.image=UIImage(named: image)
        childVC.tabBarItem.selectedImage=UIImage(named: selectedImage)!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        let selectedTitle=NSMutableDictionary()  //初始化一个可变字典
        selectedTitle[NSForegroundColorAttributeName]=UIColor.orangeColor() //设定该字典的背景颜色属性
        
        childVC.tabBarItem.setTitleTextAttributes(selectedTitle as! [String:AnyObject], forState: UIControlState.Selected)
    
        let nav=UINavigationController(rootViewController: childVC)
        
        return nav
        
    }
        
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let tabIndex=tabBar.items!.indexOf(item)
        if(tabIndex==2){
            item.enabled=false
        }else{
            item.enabled=true
        }
    }

    func releaseBlog(){
        self.presentViewController(NewBlogViewController(), animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//}
