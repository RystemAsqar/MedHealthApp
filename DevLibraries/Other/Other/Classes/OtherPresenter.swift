//
//  OtherPresenter.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import Foundation

class OtherPresenter: ViewToPresenterOtherProtocol {

    // MARK: Properties
    var view: PresenterToViewOtherProtocol?
    var interactor: PresenterToInteractorOtherProtocol?
    var router: PresenterToRouterOtherProtocol?
}

extension OtherPresenter: InteractorToPresenterOtherProtocol {
    
}
