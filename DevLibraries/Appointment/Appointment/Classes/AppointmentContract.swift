//
//  AppointmentContract.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewAppointmentProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAppointmentProtocol {
    
    var view: PresenterToViewAppointmentProtocol? { get set }
    var interactor: PresenterToInteractorAppointmentProtocol? { get set }
    var router: PresenterToRouterAppointmentProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorAppointmentProtocol {
    
    var presenter: InteractorToPresenterAppointmentProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterAppointmentProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterAppointmentProtocol {
    
}
