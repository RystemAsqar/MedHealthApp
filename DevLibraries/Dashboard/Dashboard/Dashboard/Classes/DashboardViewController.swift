//
//  DashboardViewController.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import UIKit

public class DashboardViewController: UIViewController {
    
    private var customNavBar: CustomNavBar = .init()
    private var bodyView: BodyView = .init()
    
    // MARK: - Lifecycle Methods
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        configureViews()
        configureConstraints()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterDashboardProtocol?
    
}

extension DashboardViewController: PresenterToViewDashboardProtocol{
    // TODO: Implement View Output Methods
    
    func configureViews() {
        view.addSubview(customNavBar)
        view.addSubview(bodyView)
    }
    func configureConstraints() {
        customNavBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(100)
        }
        bodyView.snp.makeConstraints {
            $0.top.equalTo(customNavBar.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
}
