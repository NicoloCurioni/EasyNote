//
//  LoginController.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 31/03/22.
//

import UIKit

class LoginController: UIViewController {
    
    private var horizontalTopStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var horizontalTop2ndStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .black
        label.font = .systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    
    private var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 2
        return stackView
    }()
    
    private var cancelButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
        return button
    }()
    
    private var emptyButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    var loginButton: GenericButton = {
        let button = GenericButton()
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    private var usernameField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = false
        textField.placeholder = "Username"
        return textField
    }()
    
    private var passwordField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Methods
    
    // Private
    
    private func setupUI() {
     
        title = Localizable.loginAuthLoginTitle
        loginLabel.text = Localizable.loginAuthLoginTitle
        
        view.backgroundColor = UIColor.easyNote.appBackground
        
        usernameField.delegate = self
        passwordField.delegate = self
        
        loginButton.setButtonTitle(Localizable.loginAuthLoginTitle)
        
        setupContraints()
    }
    
    private func setupContraints() {
        
        // Top Buttons
        
        [cancelButton, emptyButton].forEach(horizontalTopStackView.addArrangedSubview(_:))
        
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.imageView?.tintColor = .black
        cancelButton.frame.size = CGSize(width: 60, height: 60)
        
        [horizontalTopStackView, usernameField, passwordField, loginButton].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            
            horizontalTopStackView.heightAnchor.constraint(equalToConstant: 48),
            horizontalTopStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            horizontalTopStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            horizontalTopStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            usernameField.topAnchor.constraint(equalTo: horizontalTopStackView.bottomAnchor, constant: 8),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),

            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 8),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            loginButton.heightAnchor.constraint(equalToConstant: 52),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
    
    @objc
    private func didTapCancel() {
        dismiss(animated: true)
    }
    
    @objc
    private func didTapLogin() {
        print(#function)
        
        let noteListController = NoteListController()
        
        self.present(noteListController, animated: true)
    }
}
