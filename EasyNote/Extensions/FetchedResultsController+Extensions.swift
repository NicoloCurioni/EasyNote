//
//  FetchedResultsController+Extensions.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 30/03/22.
//

import Foundation
import CoreData
import UIKit

extension NoteListController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("item changed/added")
        
        self.mainTableView.reloadData()
    }
}
