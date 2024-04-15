//
//  CustomNavBar.swift
//  Appointment
//
//  Created by Rystem Asqar on 4/15/24.
//

import SnapKit
import UIKit


class CustomNavBar: UIView {
    
    private lazy var primaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "JockeyOne-Regular", size: 20.0)
        label.textColor = UIColor(named: "Main")
        return label
    }()
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "JockeyOne-Regular", size: 40.0)
        label.textColor = UIColor(named: "Main")
        return label
    }()
    private lazy var profileView: UIImageView = {
        let image = UIImageView()
        image.tintColor = UIColor(named: "Main")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomNavBar {
    func configureViews(){
        addSubview(primaryLabel)
        addSubview(userNameLabel)
        addSubview(profileView)
    }
    func configureConstraints() {
        primaryLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(primaryLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
        }
        profileView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
    }
    func configure() {
        primaryLabel.text = "Hello,"
        userNameLabel.text = "Rustem"
        profileView.image = UIImage(systemName: "person.crop.circle")
    }
}

