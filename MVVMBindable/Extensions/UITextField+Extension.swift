//
//  UITextField+Extension.swift
//  MVVMBindable
//
//  Created by Marcello Chuahy on 24/08/23.
//

import UIKit

extension UITextField {
    
    func setLeftPadding(_ padding: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    static func getTextField(withPlaceholder placeholder: String) -> UITextField {
        
        let textField = UITextField(frame: .zero)
        textField.placeholder = placeholder
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.setLeftPadding(8)
        textField.setRightPadding(8)
        textField.textAlignment = .center
        
        return textField
        
    }
    
}
