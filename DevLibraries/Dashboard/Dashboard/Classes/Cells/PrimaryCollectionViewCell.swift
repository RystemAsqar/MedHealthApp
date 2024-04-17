//
//  PrimaryCollectionViewCell.swift
//  Appointment
//
//  Created by Rystem Asqar on 4/15/24.
//

import UIKit
import SnapKit

class PrimaryCollectionViewCell: UICollectionViewCell {
    static let IDENTIFIER = "PrimaryCollectionViewCell"
    
    private lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "exclamationmark.shield")
        image.tintColor = .white
        return image
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Main stream"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViews()
        configureConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PrimaryCollectionViewCell {
    func configureViews() {
        contentView.addSubview(iconView)
        contentView.addSubview(label)
        contentView.backgroundColor = UIColor(named: "Main")
        contentView.layer.cornerRadius = 15
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
        contentView.layer.shadowRadius = 4.0
    }
    func configureConstraints() {
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        iconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(label.snp.trailing).offset(10)
            $0.width.height.equalTo(60)
        }
    }
}
