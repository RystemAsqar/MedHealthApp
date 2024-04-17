//
//  SecondaryCollectionViewCell.swift
//  Dashboard
//
//  Created by Rystem Asqar on 4/16/24.
//

import UIKit

class SecondaryCollectionViewCell: UICollectionViewCell {
    static let IDENTIFIER = "SecondaryCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
