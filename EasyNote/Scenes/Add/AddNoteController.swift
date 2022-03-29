//
//  AddNoteController.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import UIKit

class AddNoteController: UITableViewController {
    
    private var cancelBarButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        return barButton
    }()
    
    private var saveBarButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        return barButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Actions
    
    // Private
    
    @objc
    private func didTapCancel() {
        print(#function)
    }
    
    @objc
    private func didTapSave() {
        print(#function)
    }
    
    // Setup UI
    private func setupUI() {
        
        // Title
        title = "New Note"
        
        // Bar Buttons
        cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapCancel))
        saveBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
        saveBarButtonItem.style = .done
        
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        navigationItem.rightBarButtonItem = saveBarButtonItem
    }
    
}
