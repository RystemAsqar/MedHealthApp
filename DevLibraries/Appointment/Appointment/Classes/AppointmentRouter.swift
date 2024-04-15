//
//  AppointmentRouter.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import Foundation
import UIKit

class AppointmentRouter: PresenterToRouterAppointmentProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = AppointmentViewController()
        
        let presenter: ViewToPresenterAppointmentProtocol & InteractorToPresenterAppointmentProtocol = AppointmentPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = AppointmentRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = AppointmentInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
