//
//  ViewModel.swift
//  MVVMBindable
//
//  Created by Marcello Chuahy on 23/08/23.
//

import Foundation
import UIKit.UIColor

protocol ViewModelProtocol {
    
    var username: Bindable<String?> { get set }
    var password: Bindable<String?> { get set }
    var customBackgroundColor: Bindable<UIColor> { get set }
    
    func checkIfLoginIsValid()
    
}

class ViewModel: ViewModelProtocol {
    
    var username: Bindable<String?> = Bindable(value: nil)
    var password: Bindable<String?> = Bindable(value: nil)
    
    var customBackgroundColor: Bindable<UIColor> = Bindable(value: .white)
    
    func checkIfLoginIsValid() {

        let isValid = username.value == "user" && password.value == "1234"
        
        customBackgroundColor.value = isValid ? .green : .red
   
    }
    
}
