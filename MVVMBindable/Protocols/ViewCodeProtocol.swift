//
//  ViewCodeProtocol.swift
//  MVVMBindable
//
//  Created by Marcello Chuahy on 23/08/23.
//

import Foundation

protocol ViewCodeProtocol: AnyObject {
    
    func addSubviews()
    func addConstraints()
    func setupViews()
    
    func callViewCodeMethodsInCorrectSequence()
    
}

extension ViewCodeProtocol {
    
    func callViewCodeMethodsInCorrectSequence() {
        addSubviews()
        addConstraints()
        setupViews()
    }
    
}
