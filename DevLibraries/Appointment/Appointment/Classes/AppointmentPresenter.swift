//
//  AppointmentPresenter.swift
//  Pods
//
//  Created by Rystem Asqar on 4/15/24.
//  
//

import Foundation

class AppointmentPresenter: ViewToPresenterAppointmentProtocol {

    // MARK: Properties
    var view: PresenterToViewAppointmentProtocol?
    var interactor: PresenterToInteractorAppointmentProtocol?
    var router: PresenterToRouterAppointmentProtocol?
}

extension AppointmentPresenter: InteractorToPresenterAppointmentProtocol {
    
}
