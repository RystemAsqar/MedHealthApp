//
//  OtherViewController.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import UIKit

public class OtherViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }

    // MARK: - Properties
    var presenter: ViewToPresenterOtherProtocol?
    
}

extension OtherViewController: PresenterToViewOtherProtocol{
    // TODO: Implement View Output Methods
}
