//
//  BlueTextField.swift
//  Appointment
//
//  Created by Rystem Asqar on 4/24/24.
//

import UIKit
import SnapKit

open class BlueTextField: UITextField {
    open var button = UIButton()
    open var closure: (() -> ())?
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        self.addSubview(button)
        button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        
        self.layer.cornerRadius = 12
    }
    
    private func setupConstraints() {
        button.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-16)
            $0.height.width.equalTo(16)
        }
    }
    
    @objc
    private func onButtonTapped() {
        closure?()
    }
    
    open func showSuccessState() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.2784313725, green: 0.7647058824, blue: 0.9137254902, alpha: 1)
    }
    
    open func showErrorState() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.9607843137, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
    }
    
    open func clearBorder() {
        self.layer.borderWidth = 0.0
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    open func changeBorderColor(color: UIColor) {
        self.layer.borderColor = color.cgColor
        setNeedsLayout()
    }
}


public extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }

    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        rightView = paddingView
        rightViewMode = .always
    }
}

