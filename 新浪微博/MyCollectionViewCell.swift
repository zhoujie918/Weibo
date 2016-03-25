//
//  MyCollectionViewCell.swift
//  新浪微博
//
//  Created by 周杰 on 16/3/4.
//  Copyright © 2016年 周杰. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    let cellImgView=UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellImgView.frame=CGRectMake(0, 0, 80, 80);
        self.addSubview(cellImgView)
    }

    func collectionCellLoad(cellImage:String){
        cellImgView.image=UIImage(named: cellImage)
    }
    
//    func showImage(cellImage:String){
//        let tapGesture=UITapGestureRecognizer(target: self, action: "handleTapGesture")
//        tapGesture.numberOfTapsRequired=1
//        self.addGestureRecognizer(tapGesture)
//        
//        var showImageView=UIImageView(image: UIImage(named: cellImage))
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
