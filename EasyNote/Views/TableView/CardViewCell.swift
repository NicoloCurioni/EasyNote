//
//  CardViewCell.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 29/03/22.
//

import UIKit

class CardViewCell: UITableViewCell {
    
    let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let noteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let noteLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    // Private
    private func setupConstraint() {
        
        // CardView (1st layer)
        addSubview(cardView)
        
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12).isActive = true
        
        // ImageView (2nd layer)
        cardView.addSubview(noteImageView)
        
        noteImageView.heightAnchor.constraint(equalToConstant: 260).isActive = true
        noteImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        noteImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        noteImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        noteImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        
        // Label (3rd layer)
        cardView.addSubview(noteLabel)
        
        noteLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        noteLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
        
        // Remove the selection style from the cell
        selectionStyle = .none
    }
}
