//
//  ViewController.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import UIKit

class HomeController: UIViewController {
    
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .black
        label.font = .systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    
    private var horizontalTopStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
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
        button.isEnabled = true
        return button
    }()
    
    var registerButton: GenericButton = {
        let button = GenericButton()
        button.addTarget(self, action: #selector(didTapGotoRegister), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Methods
    
    // Private
    
    private func setupUI() {
        
        welcomeLabel.text = Localizable.homeTitle
        
        view.backgroundColor = UIColor.easyNote.appBackground
        
        loginButton.setButtonTitle(Localizable.homeLogin)
        registerButton.setButtonTitle(Localizable.homeRegister)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        [loginButton, registerButton].forEach(verticalBottomStackView.addArrangedSubview(_:))
        
        [welcomeLabel].forEach(horizontalTopStackView.addArrangedSubview(_:))
        
        [horizontalTopStackView, verticalBottomStackView].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            
            horizontalTopStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalTopStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            horizontalTopStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            verticalBottomStackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginButton.heightAnchor.constraint(equalToConstant: 46),
            registerButton.heightAnchor.constraint(equalToConstant: 46),
            
            verticalBottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            verticalBottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28),
            verticalBottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
    
    private func didTapShowController(_ controller: UIViewController) {
        controller.modalPresentationStyle = .automatic
        present(controller, animated: true)
    }
    
    @objc
    private func didTapGotoLogin() {
        print(#function)
        
        let loginController = LoginController()
        
        didTapShowController(loginController)
    }
    
    @objc
    private func didTapGotoRegister() {
        print(#function)
    }
}

