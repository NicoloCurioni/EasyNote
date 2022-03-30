//
//  NoteListController.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import UIKit
import CoreData

class NoteListController: UIViewController {
    
    var mainTableView: UITableView = {
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
    
    var persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchedResultsController : NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchLocalData()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchLocalData()
    }
    
    // MARK: - Actions
    
    // Private
    
    func showDetailController(at indexPath: IndexPath) {
        let addNoteVC = AddNoteController()
        let selectedNote : Note = fetchedResultsController.object(at: indexPath) as! Note
        
        addNoteVC.selectedNote = selectedNote
        
        self.navigationController?.present(addNoteVC, animated: true)
    }
    
    private func setupUI() {
        title = "Notes"
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewEntry))
        navigationItem.rightBarButtonItem = addBarButton
        
        view.backgroundColor = .white
    }
    
    private func fetchLocalData() {

        fetchedResultsController = getFetchRequest()
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
            return
        }
        
        self.mainTableView.reloadData()
    }
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        let sorter = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sorter]
        
        return fetchRequest
    }
    
    func getFetchRequest() -> NSFetchedResultsController<NSFetchRequestResult> {
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: persistentContainer, sectionNameKeyPath: nil, cacheName: nil)
        
        return fetchedResultsController
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
        
        let noteListController = AddNoteController()
        noteListController.modalPresentationStyle = .automatic
        present(noteListController, animated: true)
    }
}
