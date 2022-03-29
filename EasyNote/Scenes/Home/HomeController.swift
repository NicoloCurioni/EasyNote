//
//  ViewController.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import UIKit

class HomeController: UIViewController {
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "EasyNote"
        
        labelName.text = "Hello, World!"
        
        [labelName].forEach(mainStackView.addArrangedSubview(_:))
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelName.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            labelName.centerYAnchor.constraint(equalTo: mainStackView.centerYAnchor),
        ])
    }
}

