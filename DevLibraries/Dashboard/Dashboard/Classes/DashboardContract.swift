//
//  DashboardContract.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewDashboardProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDashboardProtocol {
    
    var view: PresenterToViewDashboardProtocol? { get set }
    var interactor: PresenterToInteractorDashboardProtocol? { get set }
    var router: PresenterToRouterDashboardProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDashboardProtocol {
    
    var presenter: InteractorToPresenterDashboardProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDashboardProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDashboardProtocol {
    
}
