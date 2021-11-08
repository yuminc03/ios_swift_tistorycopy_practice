//
//  TabBarViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/26.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        view.tintColor = .none
        tabBar.backgroundColor = .gray
        tabBar.backgroundImage = nil
//        tabBar.isCustomizing = true
//        tabBar.tintColor = .black
//        tabBar.unselectedItemTintColor = .white
        tabBar.isTranslucent = false
        // ex
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red.withAlphaComponent(0.5)
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .green.withAlphaComponent(0.5)
//        let vc3 = UIViewController()
//        vc3.view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        
        
        viewControllers = [
            createTabBarItem(tabBarTitle: "HOME", viewController: vc1),
            createTabBarItem(tabBarTitle: "FEED", viewController: vc2),
            createTabBarItem(tabBarTitle: "WRITE", viewController: WritingFormViewController()),
            createTabBarItem(tabBarTitle: "NOTICE", viewController: NoticeViewController()),
            createTabBarItem(tabBarTitle: "PROFILE", viewController: ProfileViewController())]
    }
    
    func createTabBarItem(tabBarTitle: String, tabBarImage: String? = nil, viewController: UIViewController) -> UINavigationController {
        let navCont = UINavigationController(rootViewController: viewController)
        navCont.tabBarItem.title = tabBarTitle
//        navCont.tabBarItem.image = UIImage(named: tabBarImage)
        navCont.navigationBar.isHidden = true
        
        return navCont
    }
}

