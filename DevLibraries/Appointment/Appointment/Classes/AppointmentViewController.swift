//
//  AppointmentViewController.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import UIKit

public class AppointmentViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }

    // MARK: - Properties
    var presenter: ViewToPresenterAppointmentProtocol?
    
}

extension AppointmentViewController: PresenterToViewAppointmentProtocol{
    // TODO: Implement View Output Methods
}
