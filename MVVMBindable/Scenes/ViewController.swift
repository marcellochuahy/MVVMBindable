//
//  ViewController.swift
//  MVVMBindable
//
//  Created by Marcello Chuahy on 23/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var customView: UIView?
    var viewModel: ViewModelProtocol?
    
    // MARK: - Initializers

    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle
    
    override func loadView() {
        configureUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.username.bind({ username in
            print("username: \(username ?? "")")
        })
        
        viewModel?.password.bind({ password in
            print("password: \(password ?? "")")
        })
        
        viewModel?.customBackgroundColor.bind({ [weak self] customBackgroundColor in
            guard let weakself = self else { return }
            weakself.view.backgroundColor = customBackgroundColor
        })
    
    }
    
    // MARK: - Methods
    
    func configureUI() {
        customView = CustomView(viewModel: viewModel)
        view = customView
    }
  
}
