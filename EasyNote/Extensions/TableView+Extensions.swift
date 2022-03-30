//
//  TableView+Extensions.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import Foundation
import UIKit
import CoreData

extension NoteListController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRows = fetchedResultsController.sections?[section].numberOfObjects else {
            return 0
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardViewCell
        let note = fetchedResultsController.object(at: indexPath) as! Note
        
        let imageData = UIImage(data: note.image ?? Data())
        
        cell.noteLabel.text = note.name
        cell.noteImageView.image = imageData
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.showDetailController(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let managedObject : NSManagedObject = fetchedResultsController.object(at: indexPath) as! NSManagedObject
        
        persistentContainer.delete(managedObject)
        
        let alert = UIAlertController(title: "Delete", message: "Are you sure to delete this note?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            
            do {
                try self.persistentContainer.save()
            } catch {
                print(error)
                return
            }
        }))
        
        present(alert, animated: true)
        
        self.mainTableView.deleteRows(at: [indexPath], with: .fade)
    }
}
