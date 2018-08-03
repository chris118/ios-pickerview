//
//  ViewController.swift
//  ios-pickerview
//
//  Created by Chris on 2018/8/3.
//  Copyright © 2018年 putao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.items = ["1","2","3","4","5","6"]
        pickerView.didSelect = {(index) in
            print(index)
        }
    }
    
    @IBAction func tap(_ sender: Any) {
        pickerView.show()
    }
    
    private lazy var pickerView: EBItemPickerView = {
        var picker = EBItemPickerView()
        return picker
    }()
}

