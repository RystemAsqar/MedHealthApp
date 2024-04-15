//
//  DashboardRouter.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import Foundation
import UIKit

class DashboardRouter: PresenterToRouterDashboardProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = DashboardViewController()
        
        let presenter: ViewToPresenterDashboardProtocol & InteractorToPresenterDashboardProtocol = DashboardPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = DashboardRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DashboardInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
