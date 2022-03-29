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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var notes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        #if DEBUG
        notes = [
            "Apple iPhone 14, no words..",
            "NYC is fantastic!",
            "Rome, ehm, a great city",
            "I like Programming"
        ]
        #endif
        
        view.backgroundColor = .white
        
        view.addSubview(mainTableView)
        
        NSLayoutConstraint.activate([
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}
