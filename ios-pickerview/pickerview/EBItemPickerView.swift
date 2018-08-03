//
//  EBItemPickerView.swift
//  ios-pop-view
//
//  Created by Chris on 2018/8/3.
//  Copyright © 2018年 putao. All rights reserved.
//

import UIKit

class EBItemPickerView: UIView {
    var items = [String](){
        didSet {
            self.pickerView.reloadAllComponents()
        }
    }
    
    var didSelect: ((Int) -> ())?
    
    func show() {
        overlayView.show()
        contentView.frame.origin.y = farHeight
        UIView.animate(withDuration: 0.3) {
            self.contentView.frame.origin.y = UIScreen.main.bounds.height - self.heightContent
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.frame.origin.y = self.farHeight
        }) { (complete) in
            self.overlayView.hide()
        }
    }
    
    private let heightContent: CGFloat = 280
    private let farHeight: CGFloat = 2000
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        contentView.addSubview(pickerView)
        overlayView.addSubview(contentView)
    }
    
    private lazy var overlayView: EBMaskView = {
        var _mask = EBMaskView()
        return _mask
    }()
    
    private lazy var contentView: UIView = {
        var content = EBContentView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - heightContent, width: UIScreen.main.bounds.width, height: heightContent))
        content.cancel = {[weak self] in
             self?.hide()
        }
        content.confirm = {[weak self] in
            self?.hide()
        }
        return content
    }()
    
    private lazy var pickerView: UIPickerView = {
        var _pickerView = UIPickerView(frame: CGRect(x: 0, y: 45, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width - 45))
        _pickerView.dataSource = self
        _pickerView.delegate = self
        return _pickerView
    }()
}

// MARK: UIPickerViewDelegate
extension EBItemPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let _didSelect = didSelect {
            _didSelect(row)
        }
    }
}

// MARK: UIPickerViewDataSource
extension EBItemPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }

}
