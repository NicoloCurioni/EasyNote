//
//  TableView+Extensions.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import Foundation
import UIKit

extension NoteListController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardViewCell
        let note = notes[indexPath.row]
        
        cell.noteLabel.text = note.name
        cell.noteImageView.image = UIImage(named: note.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
