//
//  TabBarController.swift
//  MedHealthApp
//
//  Created by Rystem Asqar on 4/13/24.
//

import UIKit

open class TabBarController: UITabBarController {
    public override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)

        // TODO: use common colors
        tabBar.barTintColor = .clear
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = .white
        tabBar.backgroundColor = .main
    }
    open override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
//    open override func viewWillLayoutSubviews() {
//        var tabFrame = self.tabBar.frame
//            tabFrame.size.height = 80
//            tabFrame.origin.y = self.view.frame.size.height - 10
//            self.tabBar.frame = tabFrame
//    }
    
}
