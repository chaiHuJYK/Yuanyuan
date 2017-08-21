//
//  ACellView.swift
//  Yuanyuan
//
//  Created by 山梨 on 17/5/12.
//  Copyright © 2017年 2Dfire. All rights reserved.
//

import UIKit

class ACellView: UIView {
    let theBgImageNameString = "IMG_0.jpg"
    var theImageNameString = ""
    var theImageView: UIImageView = UIImageView()
    var theBgImageView: UIImageView = UIImageView()
    var isBackView: Bool = false

    func initWithImageNameString(imageName: String) -> Void {
        theImageNameString = imageName
        theImageView = UIImageView(image:UIImage(named:theImageNameString))
        theBgImageView = UIImageView(image:UIImage(named:theBgImageNameString))
        isBackView = true
        theImageView.frame = self.bounds
        theBgImageView.frame = self.bounds
        self.insertSubview(theImageView, at: 0)
        self.insertSubview(theBgImageView, at: 1)
    }
    
    public func changeImage() -> Void {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationTransition(.flipFromRight, for: self, cache: true)
        self.exchangeSubview(at: 1, withSubviewAt: 0)
        UIView.commitAnimations()
    }
}
