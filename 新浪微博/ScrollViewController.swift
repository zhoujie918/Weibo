//
//  ViewController.swift
//  新浪微博
//
//  Created by 周杰 on 15/11/3.
//  Copyright © 2015年 周杰. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView=UIScrollView()
    var pageControl=UIPageControl()
    var btn=UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        pageControl.center=CGPointMake(self.view.frame.width/2, self.view.frame.height-40)
        pageControl.numberOfPages=4
        pageControl.pageIndicatorTintColor=UIColor.whiteColor()
        pageControl.currentPageIndicatorTintColor=UIColor.redColor()
        pageControl.addTarget(self, action: "scrollViewDidEndDecelerating", forControlEvents: UIControlEvents.ValueChanged)
        
        scrollView.frame=self.view.bounds
        scrollView.contentSize=CGSizeMake(4*self.view.frame.width, 0)   //contentSize可滚动的区域
        scrollView.pagingEnabled=true
        scrollView.bounces=false  //去除弹簧效果
        scrollView.showsHorizontalScrollIndicator=false
        self.view.addSubview(scrollView)
        scrollView.delegate=self
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "scrollViewImage_1"), forBarMetrics: UIBarMetrics.Compact)   //设置导航栏透明
//        self.navigationController?.navigationBar.clipsToBounds=true //去除导航栏底部黑线
        
        for(var i=1;i<=4;i++){
            let imageView=UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            let image=UIImage(named: "scrollViewImage_"+"\(i)")
            imageView.image=image
            
            var scFrame=imageView.frame
            scFrame.origin.x=CGFloat(i-1)*imageView.frame.width
            imageView.frame=scFrame
            
            scrollView.addSubview(imageView)
            self.view.addSubview(pageControl)
            
        }
        
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        pageControl.currentPage=Int(scrollView.contentOffset.x/scrollView.frame.width)
        
        btn.frame=CGRectMake(3*self.view.frame.width, self.view.frame.height/3*2, self.view.frame.width, 50)
        btn.setTitle("开始微博之旅", forState: UIControlState.Normal)
        btn.backgroundColor=UIColor.orangeColor()
        btn.titleLabel?.font=UIFont.boldSystemFontOfSize(20)
        btn.addTarget(self, action: "btnClick", forControlEvents: UIControlEvents.TouchUpInside)
        self.scrollView.addSubview(btn)
    }
    
    func btnClick(){
        let tabBarVC=TabViewController()
        self.navigationController?.pushViewController(tabBarVC, animated: true)   //若要使用导航控制器的push方法，必须设定根控制器为导航控制器
//        self.navigationController?.popViewControllerAnimated(true)    //返回
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

