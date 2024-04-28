//
//  RegisterRouter.swift
//  Pods
//
//  Created by Rystem Asqar on 4/25/24.
//  
//

import Foundation
import UIKit

public class RegisterRouter: PresenterToRouterRegisterProtocol {
    
    // MARK: Static methods
    public static func createModule() -> UIViewController {
        
        let viewController = RegisterViewController()
        
        let presenter: ViewToPresenterRegisterProtocol & InteractorToPresenterRegisterProtocol = RegisterPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = RegisterRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = RegisterInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
