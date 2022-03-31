//
//  Buttons.swift
//  EasyNote
//
//  Created by Nicolò Curioni on 31/03/22.
//

import UIKit

class GenericButton: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
        self.backgroundColor = UIColor.easyNote.blueCalmApp
    }
}
