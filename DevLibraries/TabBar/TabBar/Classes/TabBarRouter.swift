//
//  TabBarRouter.swift
//  MedHealthApp
//
//  Created by Rystem Asqar on 4/13/24.
//

import UIKit
import Dashboard
import Appointment
import Map
import Other

public protocol TabBarRouterProtocol {
    var viewController: UIViewController? { get set }
    static func build() -> UIViewController
}

public class TabBarRouter: TabBarRouterProtocol {
    weak public var viewController: UIViewController?
    
    public static func build() -> UIViewController {
        let view = TabBarController()
        let homeVC = DashboardViewController()
        let appointmentVC = AppointmentViewController()
        let mapVC = MapViewController()
        let otherVC = OtherViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
        appointmentVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "appointment"), tag: 1)
        mapVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "map"), tag: 2)
        otherVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "other"), tag: 3)
        
        
        let controllers = [homeVC, appointmentVC, mapVC, otherVC]

        view.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }

        let router = TabBarRouter()
        router.viewController = view

        return view
        
    }
    
    
}
