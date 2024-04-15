//
//  OtherRouter.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import Foundation
import UIKit

class OtherRouter: PresenterToRouterOtherProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        let viewController = OtherViewController()
        
        let presenter: ViewToPresenterOtherProtocol & InteractorToPresenterOtherProtocol = OtherPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = OtherRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = OtherInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
