//
//  NoteListController.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import UIKit

class NoteListController: UIViewController {
    
    private var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CardViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var addBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        return barButton
    }()
    
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewEntry))
        navigationItem.rightBarButtonItem = addBarButton
        
        #if DEBUG
        notes = [
            Note(name: "Apple iPhone 14, no words..", image: "sampleImage"),
            Note(name: "NYC is fantastic!", image: "sampleImage"),
            Note(name: "Rome, ehm, a great city", image: "sampleImage"),
            Note(name: "I like Programming", image: "sampleImage")
        ]
        #endif
        
        view.backgroundColor = .white
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    @objc
    private func addNewEntry() {
        print(#function)
    }
}
