//
//  RootViewController.swift
//  Yuanyuan
//
//  Created by 山梨 on 17/5/11.
//  Copyright © 2017年 2Dfire. All rights reserved.
//

import UIKit


class RootViewController: UIViewController {
    var theFirstCellView:(ACellView)!
    let rootImgView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        // Do any additional setup after loading the view.
        self.setImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func setImages() -> Void {
        let screenWidth:Double = Double(UIScreen.main.bounds.size.width)
        let b: Double = 3264 / 2248
        let spacingWithImage: Double = 8.0
        let imageWidth: Double = screenWidth / 6
        
        let imgFirstName = "IMG_"
        let imgLastName = ".jpg"
        var doubleImgArr = [ACellView]()
        for i in 0...1 {
            NSLog("%d",i)
            for index in 1...8 {
                let imgName = imgFirstName + index.description + imgLastName
                let cellView = ACellView()
                cellView.frame = CGRect(x:0, y:0, width:imageWidth, height:imageWidth * b)
                cellView.initWithImageNameString(imageName: imgName)
                doubleImgArr.append(cellView)
            }
        }
        
        self.rootImgView.frame = CGRect(x:0, y:0, width:(4.0 * imageWidth + 3.0 * 8.0), height:(4.0 * imageWidth * b + 3.0 * 8.0))
        for xIndex in 0...3 {
            for yIndex in 0...3 {
                NSLog("%d %d = %d", xIndex, yIndex, (xIndex * 4) + yIndex);
                let count = doubleImgArr.count;
                let nowArrIndex = Int(arc4random_uniform(UInt32(count)))
                let imageView = doubleImgArr[nowArrIndex]
                doubleImgArr.remove(at: nowArrIndex)
                imageView.frame = CGRect(x:(Double(xIndex) * (spacingWithImage + imageWidth)), y:(Double(yIndex) * ((imageWidth * b) + spacingWithImage)), width:imageWidth, height:(imageWidth * b))
                imageView.theImageView.frame = imageView.bounds
                self.rootImgView.addSubview(imageView)
                let oneTap = UITapGestureRecognizer(target: self, action: #selector(self.clickOneTap))
                oneTap.numberOfTapsRequired = 1
                imageView.isUserInteractionEnabled = true
                imageView.addGestureRecognizer(oneTap)
            }
        }
        self.rootImgView.center = self.view.center
        self.view.addSubview(self.rootImgView)
    }

    //实现手势方法
    func clickOneTap(sender: UITapGestureRecognizer)
    {
        guard let nowImageView:ACellView = sender.view as? ACellView else {
            return
        }
        nowImageView.changeImage()
        if (self.theFirstCellView != nil) {
            //延时0.8秒执行
            self.view.isUserInteractionEnabled = false;
            let time: TimeInterval = 0.8
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                self.theFirstCellView.changeImage()
                nowImageView.changeImage()
                if (self.theFirstCellView.theImageNameString == nowImageView.theImageNameString) {
                    self.theFirstCellView.removeFromSuperview()
                    nowImageView.removeFromSuperview()
                    print("---- %d --", self.rootImgView.subviews.count)
                    if (self.rootImgView.subviews.count <= 0) {
                        let alertController = UIAlertController(title: "提示",
                                                                message: "好厉害", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                            action in
                            print("点击了确定")
                        })
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
                self.theFirstCellView = nil;
                self.view.isUserInteractionEnabled = true;
            }
        } else {
            self.theFirstCellView = nowImageView
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
