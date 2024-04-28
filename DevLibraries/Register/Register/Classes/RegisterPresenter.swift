//
//  RegisterPresenter.swift
//  Pods
//
//  Created by Rystem Asqar on 4/25/24.
//  
//

import Foundation

class RegisterPresenter: ViewToPresenterRegisterProtocol {

    // MARK: Properties
    var view: PresenterToViewRegisterProtocol?
    var interactor: PresenterToInteractorRegisterProtocol?
    var router: PresenterToRouterRegisterProtocol?
}

extension RegisterPresenter: InteractorToPresenterRegisterProtocol {
    
}
