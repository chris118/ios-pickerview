//
//  EBContentView.swift
//  ios-pop-view
//
//  Created by Chris on 2018/8/3.
//  Copyright © 2018年 putao. All rights reserved.
//

import UIKit

/*
 * 容器View 包括取消 确定按钮
 */
class EBContentView: UIView {
    fileprivate let buttonWidth: CGFloat = 66
    fileprivate let buttonHeight: CGFloat = 44
    
    var confirm: (() -> ())?
    var cancel: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc private func cancelAction() -> Void {
        if let _cancel = cancel {
            _cancel()
        }
    }
    
    @objc private func okAction() -> Void {
        if let _confirm = confirm {
            _confirm()
        }
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor.white
        self.addSubview(okButton)
        self.addSubview(cancelButton)
        self.addSubview(line)
    }
    
    private lazy var okButton: UIButton = {
        var btn = UIButton(type:.system)
        btn.frame = CGRect(x: UIScreen.main.bounds.width - buttonWidth, y: 0, width: buttonWidth, height: buttonHeight)
        btn.setTitle("确定", for: .normal)
        btn.addTarget(self, action: #selector(okAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var cancelButton: UIButton = {
        var btn = UIButton(type:.system)
        btn.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonHeight)
        btn.setTitle("取消", for: .normal)
        btn.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var line: UIView = {
        var line = UIView(frame: CGRect(x: 0, y: buttonHeight, width: UIScreen.main.bounds.width, height: 0.5))
        line.backgroundColor = UIColor(red: 136/255.0, green: 136/255.0, blue: 136/255.0, alpha: 0.5)
        return line
    }()
}
