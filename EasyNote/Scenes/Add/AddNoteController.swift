//
//  AddNoteController.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import UIKit

class AddNoteController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "New Note"
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
}
