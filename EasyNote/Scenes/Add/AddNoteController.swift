//
//  AddNoteController.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import UIKit
import CoreData

class AddNoteController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    var selectedNote : Note? = nil
    
    private var horizontalTopStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    private var verticalTopStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var cancelButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapCancel), for: .touchUpInside)
        return button
    }()
    
    var saveButton: GenericButton = {
        let button = GenericButton()
        button.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    private var emptyButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var horizontalBottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var imageViewPlaceholder: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.shadowColor = UIColor.blue.cgColor
        imageView.layer.shadowOpacity = 0.4
        imageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        imageView.layer.shadowRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private var textViewNoteContent:UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.clipsToBounds = true
        textView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        textView.layer.shadowColor = UIColor.gray.cgColor
        textView.layer.shadowOpacity = 0.4
        textView.layer.shadowRadius = 14
        textView.font = .systemFont(ofSize: 20, weight: .medium)
        textView.textColor = UIColor(named: "CalmGray")
        return textView
    }()
    
    private let tapGesture = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
        imageViewPlaceholder.image = UIImage(named: "sampleImage")
        #endif
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkNote()
    }
    
    // MARK: - Actions
    
    // Private
    
    @objc
    private func didTapCancel() {
        dismiss(animated: true)
    }
    
    @objc
    private func didTapSave() {
        print(#function)
        guard
            let image = imageViewPlaceholder.image,
            textViewNoteContent.text != "" else {
                return
            }
        
        self.saveLocalData(UUID().uuidString, name: textViewNoteContent.text, date: Date(), image: image)
    }
    
    private func saveLocalData(_ id: String, name: String, date: Date, image: UIImage) {
        if selectedNote == nil {
            let entityDescription = NSEntityDescription.entity(forEntityName: "Note", in: persistentContainer)
            let newNote = Note(entity: entityDescription!, insertInto: persistentContainer)
            newNote.id = UUID().uuidString
            newNote.date = date
            newNote.name = name
            newNote.image = image.jpegData(compressionQuality: 0.8)
        } else {
            selectedNote?.name = textViewNoteContent.text
            selectedNote?.image = image.jpegData(compressionQuality: 0.8)
        }
        
        do {
            if persistentContainer.hasChanges {
                try persistentContainer.save()
            }
        } catch {
            print(error)
            return
        }
        
        dismiss(animated: true)
    }
    
    // Setup UI
    private func setupUI() {
        
        // Title
        checkNote()
        
        view.backgroundColor = UIColor.easyNote.appBackground
        
        // Delegates
        textViewNoteContent.delegate = self
        tapGesture.delegate = self
        
        imageViewPlaceholder.addGestureRecognizer(tapGesture)
        
        tapGesture.addTarget(self, action: #selector(didTapOnImage))
        
        // Top Buttons
        
        [cancelButton, emptyButton].forEach(horizontalTopStackView.addArrangedSubview(_:))
        
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.imageView?.tintColor = .black
        cancelButton.frame.size = CGSize(width: 60, height: 60)
        saveButton.setTitle("Save", for: .normal)
        
        [imageViewPlaceholder].forEach(horizontalStackView.addArrangedSubview(_:))
        
        [horizontalTopStackView, horizontalStackView, textViewNoteContent, horizontalBottomStackView].forEach(view.addSubview(_:))
        
        [saveButton].forEach(horizontalBottomStackView.addArrangedSubview(_:))
        
        NSLayoutConstraint.activate([
            
            horizontalTopStackView.heightAnchor.constraint(equalToConstant: 48),
            horizontalTopStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            horizontalTopStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            horizontalTopStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            textViewNoteContent.heightAnchor.constraint(equalToConstant: 200),
            textViewNoteContent.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor),
            textViewNoteContent.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 8),
            textViewNoteContent.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor),
            
            cancelButton.leadingAnchor.constraint(equalTo: horizontalTopStackView.leadingAnchor, constant: 8),
            cancelButton.topAnchor.constraint(equalTo: horizontalTopStackView.topAnchor, constant: 8),
            cancelButton.bottomAnchor.constraint(equalTo: horizontalTopStackView.bottomAnchor, constant: 8),
            
            horizontalStackView.heightAnchor.constraint(equalToConstant: 230),
            horizontalStackView.leadingAnchor.constraint(equalTo: horizontalTopStackView.leadingAnchor, constant: 8),
            horizontalStackView.topAnchor.constraint(equalTo: horizontalTopStackView.bottomAnchor, constant: 8),
            horizontalStackView.trailingAnchor.constraint(equalTo: horizontalTopStackView.trailingAnchor, constant: -8),
            
            saveButton.heightAnchor.constraint(equalToConstant: 52),
            horizontalBottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            horizontalBottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28),
            horizontalBottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
    
    // MARK: - Actions
    
    // Private
    
    private func addImage() {
        let actionSheet = UIAlertController(title: "Photo", message: "Choose or take a new photo", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        actionSheet.addAction(UIAlertAction(title: "Library", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            
            self.choosePhotoFromLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            
            self.makeNewFromCamera()
        }))
        
        present(actionSheet, animated: true)
    }
    
    private func makeNewFromCamera() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.allowsEditing = true
        
        self.present(picker, animated: true, completion: nil)
    }
    
    private func choosePhotoFromLibrary() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        self.present(picker, animated: true, completion: nil)
    }
    
    private func checkNote() {
        
        if selectedNote == nil {
            self.navigationItem.title = "New Note"
            saveButton.setTitle("Save", for: .normal)
        } else {
            guard let imageData = selectedNote?.image else {
                return
            }
            
            self.navigationItem.title = "Edit Note"
            textViewNoteContent.text = selectedNote?.name
            imageViewPlaceholder.image = UIImage(data: imageData)
            saveButton.setTitle("Update", for: .normal)
            
        }
    }
    
    @objc
    private func didTapOnImage() {
        textViewNoteContent.resignFirstResponder()
        
        self.addImage()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageViewPlaceholder.image = selectedImage
        }
        self.dismiss(animated: true, completion: nil)
    }
}
