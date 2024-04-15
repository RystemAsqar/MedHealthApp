//
//  BodyView.swift
//  Dashboard
//
//  Created by Rystem Asqar on 4/15/24.
//

import UIKit
import SnapKit


class BodyView: UIView {

    private lazy var rectangle: UIView = {
        let rectangle = UIView()
        rectangle.layer.cornerRadius = 15
        rectangle.layer.shadowRadius = 10
        rectangle.layer.shadowColor = UIColor.gray.cgColor
        rectangle.layer.shadowOpacity = 1
        rectangle.layer.shadowOffset = CGSize(width: 4, height: 4)
        rectangle.layer.shadowRadius = 4.0
        rectangle.backgroundColor = UIColor(named: "Main")
        return rectangle
    }()
    private lazy var doctorIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "doctor")
        return image
    }()
    private lazy var rectanglePrimaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Self Check up Covid-19"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    private lazy var rectangleSecondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Here you can view your \nresults and data."
        label.layer.opacity = 0.7
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13)
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

extension BodyView {
    func configureViews() {
        addSubview(rectangle)
        rectangle.addSubview(rectanglePrimaryLabel)
        rectangle.addSubview(doctorIcon)
        rectangle.addSubview(rectangleSecondaryLabel)
    }
    func configureConstraints() {
        rectangle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(140)
        }
        doctorIcon.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(70)
            $0.height.equalTo(70)
        }
        rectanglePrimaryLabel.snp.makeConstraints {
            $0.leading.equalTo(doctorIcon.snp.trailing).offset(40)
            $0.top.equalToSuperview().offset(40)
        }
        rectangleSecondaryLabel.snp.makeConstraints {
            $0.top.equalTo(rectanglePrimaryLabel.snp.bottom)
            $0.leading.equalTo(rectanglePrimaryLabel.snp.leading)
        }
    }
}
