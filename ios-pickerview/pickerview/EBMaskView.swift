//
//  EBMaskView.swift
//  demo
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

/*
 * 半透明蒙板View
 */
class EBMaskView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func show() {
        UIApplication.shared.keyWindow?.addSubview(self)
         self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.1)
        UIView.animate(withDuration: 0.3) {
            self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.1)
        }) { (complete) in
            self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.4)
            self.removeFromSuperview()
        }
    }
}
