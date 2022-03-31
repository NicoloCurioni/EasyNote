//
//  ViewController.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import UIKit

class HomeController: UIViewController {
    
    private var horizontalBottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var verticalBottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    var loginButton: GenericButton = {
        let button = GenericButton()
        button.addTarget(self, action: #selector(didTapGotoLogin), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    var registerButton: GenericButton = {
        let button = GenericButton()
        button.addTarget(self, action: #selector(didTapGotoRegister), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Methods
    
    // Private
    
    private func setupUI() {
        title = "EasyNote"
        
        view.backgroundColor = UIColor.easyNote.appBackground
        
        loginButton.setButtonTitle("Login")
        registerButton.setButtonTitle("Register")
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        [loginButton, registerButton].forEach(verticalBottomStackView.addArrangedSubview(_:))
        
        [verticalBottomStackView].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            
            verticalBottomStackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginButton.heightAnchor.constraint(equalToConstant: 46),
            registerButton.heightAnchor.constraint(equalToConstant: 46),
            
            verticalBottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            verticalBottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28),
            verticalBottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
    
    @objc
    private func didTapGotoLogin() {
        print(#function)
    }
    
    @objc
    private func didTapGotoRegister() {
        print(#function)
    }
}

