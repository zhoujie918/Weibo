//
//  WeiBoTableViewCell.swift
//  新浪微博
//
//  Created by 周杰 on 16/2/15.
//  Copyright © 2016年 周杰. All rights reserved.
//

import UIKit

class WeiBoTableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var blogTopView=UIView()
    var blogContent=UILabel()
//    var blogImageView=UIImageView()
    var blogBottomView=UIView()
    
    var blogBottom1=UIButton()
    var blogBottom2=UIButton()
    var blogBottom3=UIButton()
    
    let userImgView=UIImageView()           //用户头像
    let userName=UILabel()                  //用户昵称
    let blogDate=UILabel()
    var showImageView=UIImageView()
    let arrayImages=["photo1.jpg","photo2.jpg","photo3.jpg","photo4.jpg","photo5.jpg","photo6.jpg","photo7.jpg","photo8.jpg","photo9.jpg"]

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.selectionStyle=UITableViewCellSelectionStyle.None  //使无法选择cell
        
        //顶部发帖人昵称
        self.addSubview(blogTopView)
        blogTopView.addSubview(userName)
        blogTopView.addSubview(userImgView)
//        blogTopView.frame=CGRectMake(10, 10, self.frame.width-20, 50)
        blogTopView.snp_makeConstraints { (make) -> Void in
            make.left.top.equalTo(self).inset(10)
            make.width.equalTo(self.frame.width-20)
            make.height.equalTo(50)
        }
        blogTopView.backgroundColor=UIColor.grayColor()
        userImgView.image=UIImage(named: "human")   //用户头像
        userImgView.frame=CGRectMake(1, 5, 40, 40)
        userImgView.layer.borderWidth=0.1
        userImgView.layer.cornerRadius=userImgView.frame.width/2
        userImgView.layer.masksToBounds=true        //隐藏边界
        userName.frame=CGRectMake(userImgView.frame.width/2+30, 10, 100, 15)    //用户昵称
        userName.textColor=UIColor.orangeColor()
        userName.font=UIFont.systemFontOfSize(15)
        
        //微博的发表日期
        blogTopView.addSubview(blogDate)
        blogDate.frame=CGRectMake(userImgView.frame.width/2+30, 27, 300, 15)
//        blogTopView.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(self).inset(10)
//            make.left.equalTo(self).inset(10)
//            make.width.equalTo(self.frame.width-20)
//            make.height.equalTo(50)
//        }
        blogDate.text="2-12 来自 海玲的iphone 客户端"
        blogDate.font=UIFont.systemFontOfSize(15)
        blogDate.textColor=UIColor.lightGrayColor()
        
        //微博内容
        self.addSubview(blogContent)
        blogContent.frame=CGRectMake(10, 70, self.frame.width-20, 100)
//        blogContent.layer.borderWidth=0.5
        blogContent.font=UIFont.boldSystemFontOfSize(16)
        blogContent.numberOfLines=0     //不限制行数
        blogContent.sizeToFit()

        //评论数菜单
        self.addSubview(blogBottomView)
        blogBottomView.frame=CGRectMake(0, self.frame.height-40, self.frame.width, 40)
        blogBottomView.backgroundColor=UIColor.purpleColor()
        
        //转发、评论、点赞
        blogBottomView.addSubview(blogBottom1)
        blogBottom1.frame=CGRectMake(0, 0, self.frame.width/3, 40)
        blogBottom1.layer.borderWidth=1
        blogBottom1.setTitle("转发", forState: UIControlState.Normal)
        blogBottom1.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        blogBottom1.titleLabel!.font=UIFont.systemFontOfSize(14)
        blogBottom1.addTarget(self, action: "trans", forControlEvents: UIControlEvents.TouchUpInside)

        blogBottomView.addSubview(blogBottom2)
        blogBottom2.frame=CGRectMake(self.frame.width/3, 0, self.frame.width/3, 40)
        blogBottom2.layer.borderWidth=1
        blogBottom2.setTitle("评论", forState: UIControlState.Normal)
        blogBottom2.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        blogBottom2.titleLabel!.font=UIFont.systemFontOfSize(14)
        blogBottom2.addTarget(self, action: "comment", forControlEvents: UIControlEvents.TouchUpInside)
        
        blogBottomView.addSubview(blogBottom3)
        blogBottom3.frame=CGRectMake(self.frame.width/3*2, 0, self.frame.width/3, 40)
        blogBottom3.layer.borderWidth=1
        blogBottom3.setTitle("赞", forState: UIControlState.Normal)
        blogBottom3.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        blogBottom3.titleLabel!.font=UIFont.systemFontOfSize(14)
        blogBottom3.addTarget(self, action: "zan", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        //UICollectionView
        let flowLayout=UICollectionViewFlowLayout()
        let ImgCollectionView=UICollectionView(frame: CGRectMake(20, self.frame.height-300, 260, 260), collectionViewLayout: flowLayout)
        self.addSubview(ImgCollectionView)
        ImgCollectionView.dataSource=self
        ImgCollectionView.delegate=self
        ImgCollectionView.backgroundColor=UIColor.clearColor()
    }
    
    func dataLoad(userImage:String,userName:String,contentText:String){
        self.userImgView.image=UIImage(named: userImage)
        self.userName.text=userName
        self.blogContent.text=contentText
    }
    
    //UICollectionDelegate function
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        collectionView.registerClass(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        var cell:MyCollectionViewCell!=collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MyCollectionViewCell
        
        if(cell==nil){
            cell=collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MyCollectionViewCell
        }

        cell.collectionCellLoad(arrayImages[indexPath.row])
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(80, 80)
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        showImageView.contentMode=UIViewContentMode.ScaleAspectFill
        self.window!.addSubview(showImageView)
        showImageView.userInteractionEnabled=true
        showImageView.snp_makeConstraints { (make) -> Void in
//                make.left.equalTo(self.window!.snp_left)
//                make.right.equalTo(self.window!.snp_right)
//                make.top.equalTo(self.window!.snp_top)
//                make.bottom.equalTo(self.window!.snp_bottom)
            make.edges.equalTo(self.window!).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        let tapGesture=UITapGestureRecognizer(target: self, action: "handleTapGesture")
        tapGesture.numberOfTapsRequired=1
        showImageView.addGestureRecognizer(tapGesture)
        showImageView.image=UIImage(named: arrayImages[indexPath.row])
        showImageView.hidden=false
    }

    func handleTapGesture(){
        showImageView.hidden=true
    }
    
    func trans(){

    }
    func comment(){
        
    }
    func zan(){
        
    }

}
