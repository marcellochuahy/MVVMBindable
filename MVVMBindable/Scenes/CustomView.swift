//
//  CustomView.swift
//  MVVMBindable
//
//  Created by Marcello Chuahy on 23/08/23.
//

import UIKit

class CustomView: UIView {
    
    // MARK: - Properties
    
    let viewModel: ViewModelProtocol?
    
    // MARK: - UI Properties

    private(set) lazy var usernameTextField: UITextField = {
        let textField = UITextField.getTextField(withPlaceholder: "username")
        textField.addTarget(self, action: #selector(usernameTextFieldDidEditingChange(_:)), for: .editingChanged)
        return textField
    }()

    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField.getTextField(withPlaceholder: "password")
        textField.addTarget(self, action: #selector(passwordTextFieldDidEditingChange(_:)), for: .editingChanged)
        return textField
    }()

    private(set) lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(loginButtonDidTapped(sender:)), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField, button])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // MARK: - Initializers
    
    init(viewModel: ViewModelProtocol?) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        callViewCodeMethodsInCorrectSequence()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomView: ViewCodeProtocol {
    
    func addSubviews() {
        addSubview(stackView)
    }
    
    func addConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func setupViews() {
        
        self.backgroundColor = .white
        
    }
    
}

extension CustomView {
    
    @objc
    func usernameTextFieldDidEditingChange(_ textField: UITextField) {
        viewModel?.username.value = textField.text ?? ""
    }
    
    @objc
    func passwordTextFieldDidEditingChange(_ textField: UITextField) {
        viewModel?.password.value = textField.text ?? ""
    }
    
    @objc
    func loginButtonDidTapped(sender: UIButton) {
        viewModel?.checkIfLoginIsValid()   
    }
    
}
