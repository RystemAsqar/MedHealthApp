//
//  OtherContract.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewOtherProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterOtherProtocol {
    
    var view: PresenterToViewOtherProtocol? { get set }
    var interactor: PresenterToInteractorOtherProtocol? { get set }
    var router: PresenterToRouterOtherProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorOtherProtocol {
    
    var presenter: InteractorToPresenterOtherProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterOtherProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterOtherProtocol {
    
}
