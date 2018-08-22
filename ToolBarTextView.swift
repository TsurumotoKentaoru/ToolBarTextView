//
//  ToolBarTextView.swift
//  CustomButton
//
//  Created by 鶴本賢太朗 on 2018/08/22.
//  Copyright © 2018年 Kentarou. All rights reserved.
//

import UIKit

protocol ToolBarTextViewDelegate: class {
    func didTapClose()
}

// 閉じるボタン付きのTextViewクラス
class ToolBarTextView: UITextView {
    
    internal weak var toolBarDelegate: ToolBarTextViewDelegate?
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.initToolBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initToolBar()
    }
    
    private func initToolBar() {
        let toolBar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolBar.barStyle = .default
        // スペーサー
        let spacer: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        // 閉じるボタン
        let close: UIBarButtonItem = UIBarButtonItem(title: "閉じる", style: .plain, target: self, action: #selector(self.didTapClose))
        toolBar.items = [spacer, close]
        self.inputAccessoryView = toolBar
    }
    
    @objc private func didTapClose() {
        self.toolBarDelegate?.didTapClose()
    }
}
