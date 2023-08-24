//
//  Bindable.swift
//  MVVMBindable
//
//  Created by Marcello Chuahy on 23/08/23.
//

import Foundation

class Bindable<T> {
    
    typealias Listener = (T) -> Void
    
    // MARK: - Properties
    
    var listeners: [Listener] = []

    var value: T {
        didSet {
            listeners.forEach { $0(value) }
        }
    }
    
    // MARK: - Initializers
    
    init(value: T) {
        self.value = value
    }
    
    // MARK: - Bind Methods
    
    func bind(_ listener: @escaping Listener) {
        self.listeners.append(listener)
    }
    
}
