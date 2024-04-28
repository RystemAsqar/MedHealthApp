//
//  RegisterViewController.swift
//  Pods
//
//  Created by Rystem Asqar on 4/25/24.
//  
//

import UIKit
import SnapKit
import CommonUI

public class RegisterViewController: UIViewController {
    
    private lazy var buttonConfiguration: UIButton.Configuration = {
        var configuration = UIButton.Configuration.filled()
        configuration.imagePlacement = .leading
        configuration.baseBackgroundColor = .clear
        configuration.baseForegroundColor = .black
        configuration.imagePadding = 6
        configuration.titlePadding = 6
        return configuration
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать!"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor(named: "Main")
        label.textAlignment = .left
        return label
    }()
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Зарегистрируйтесь, чтобы начать"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    private lazy var emailTextField: BlueTextField = {
        var textField = BlueTextField()
        textField.placeholder = "email@gmail.com"
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        textField.layer.borderWidth = 0.7
        textField.autocapitalizationType = .none
        textField.backgroundColor = .clear
        textField.button.setImage(UIImage(named: "closeIcon"), for: .normal)
        textField.button.isHidden = true
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(48)
//        textField.inputAccessoryView = createKeyboardToolBar()
//        textField.addTarget(self, action: #selector(emailTextDidChange(_:)), for: .editingChanged)
//        textField.closure = { [weak self] in
//            textField.text = ""
//            textField.clearBorder()
//            textField.button.isHidden = true
//            self?.loginButton.isEnabled = false
//        }
        return textField
    }()
    private lazy var passwordTextField: BlueTextField = {
        var textField = BlueTextField()
        textField.placeholder = "Введите пароль"
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        textField.layer.borderWidth = 0.7
        textField.autocapitalizationType = .none
        textField.backgroundColor = .clear
        textField.isSecureTextEntry = true
        textField.button.setImage(UIImage(named: "hideIcon"), for: .normal)
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(48)
//        textField.addTarget(self, action: #selector(passwordTextDidChange(_:)), for: .editingChanged)
//        textField.inputAccessoryView = createKeyboardToolBar()
        textField.closure = {
            if textField.text != "" {
                textField.isSecureTextEntry = !textField.isSecureTextEntry
                if textField.isSecureTextEntry {
                    textField.button.setImage(UIImage(named: "hideIcon"), for: .normal)
                } else {
                    textField.button.setImage(UIImage(named: "showIcon"), for: .normal)
                }
            }
        }
        return textField
    }()
    private lazy var confirmPasswordTextField: BlueTextField = {
        var textField = BlueTextField()
        textField.placeholder = "Подтвердите пароль"
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        textField.layer.borderWidth = 0.7
        textField.autocapitalizationType = .none
        textField.backgroundColor = .clear
        textField.isSecureTextEntry = true
        textField.button.setImage(UIImage(named: "hideIcon"), for: .normal)
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(48)
//        textField.addTarget(self, action: #selector(passwordTextDidChange(_:)), for: .editingChanged)
//        textField.inputAccessoryView = createKeyboardToolBar()
        textField.closure = {
            if textField.text != "" {
                textField.isSecureTextEntry = !textField.isSecureTextEntry
                if textField.isSecureTextEntry {
                    textField.button.setImage(UIImage(named: "hideIcon"), for: .normal)
                } else {
                    textField.button.setImage(UIImage(named: "showIcon"), for: .normal)
                }
            }
        }
        return textField
    }()
    private lazy var rightLineSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "или через"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = #colorLiteral(red: 0.1764705882, green: 0.1843137255, blue: 0.1647058824, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private lazy var leftLineSeperator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    private lazy var googleButton: UIButton = {
        let button = UIButton(configuration: buttonConfiguration)
        button.setTitle("Войти через Google", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.setImage(UIImage(named: "googleLogo"), for: .normal)
//        button.addTarget(self, action: #selector(loginGoogleButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var appleButton: UIButton = {
        let button = UIButton(configuration: buttonConfiguration)
        button.setTitle("Войти через Apple", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.setImage(UIImage(named: "appleLogo"), for: .normal)
//        button.addTarget(self, action: #selector(loginGoogleButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегестрироваться", for: .normal)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.backgroundColor = UIColor(named: "Main")
        return button
    }()
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureConstraints()
    }


    var presenter: ViewToPresenterRegisterProtocol?
    
}

extension RegisterViewController: PresenterToViewRegisterProtocol{
    func configureViews() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(leftLineSeperator)
        view.addSubview(orLabel)
        view.addSubview(rightLineSeperator)
        view.addSubview(googleButton)
        view.addSubview(appleButton)
        view.addSubview(registerButton)
    }
    func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(100)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        confirmPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        leftLineSeperator.snp.makeConstraints {
            $0.centerY.equalTo(orLabel.snp.centerY)
            $0.left.equalToSuperview().offset(24)
            $0.right.equalTo(orLabel.snp.left).offset(-16)
            $0.height.equalTo(1)
        }
        
        orLabel.snp.makeConstraints {
            $0.top.equalTo(confirmPasswordTextField.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        rightLineSeperator.snp.makeConstraints {
            $0.centerY.equalTo(orLabel.snp.centerY)
            $0.left.equalTo(orLabel.snp.right).offset(16)
            $0.right.equalToSuperview().offset(-24)
            $0.height.equalTo(1)
        }
        googleButton.snp.makeConstraints {
            $0.top.equalTo(orLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        appleButton.snp.makeConstraints {
            $0.top.equalTo(googleButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        registerButton.snp.makeConstraints {
            $0.top.equalTo(appleButton.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
    }
}
