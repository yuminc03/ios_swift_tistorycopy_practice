//
//  TabBarViewController.swift
//  TStoryApp
//
//  Created by LS-NOTE-00106 on 2021/10/26.
//

import UIKit

class TabBarViewController: UITabBarController {
    var lastTabBarIndex: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        view.tintColor = .none
        tabBar.backgroundColor = .gray
        tabBar.backgroundImage = nil
//        tabBar.delegate = self
//        tabBar.isCustomizing = true
//        tabBar.tintColor = .black
//        tabBar.unselectedItemTintColor = .white
        tabBar.isTranslucent = false
        // ex
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .white
//        let vc2 = UIViewController()
//        vc2.view.backgroundColor = .green.withAlphaComponent(0.5)
//        let vc3 = UIViewController()
//        vc3.view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        
        
        viewControllers = [
            createTabBarItem(tabBarTitle: "HOME", viewController: HomeViewController(), 0),
            createTabBarItem(tabBarTitle: "FEED", viewController: FeedViewController(), 1),
            createTabBarItem(tabBarTitle: "WRITE", viewController: WritingFormViewController(), 2),
            createTabBarItem(tabBarTitle: "NOTICE", viewController: NoticeViewController(), 3),
            createTabBarItem(tabBarTitle: "PROFILE", viewController: ProfileViewController(), 4)]
    }
    
    func createTabBarItem(tabBarTitle: String, tabBarImage: String? = nil, viewController: UIViewController, _ tag: Int) -> UINavigationController {
        let navCont = UINavigationController(rootViewController: viewController)
        navCont.view.tag = tag
        navCont.tabBarItem.title = tabBarTitle
//        navCont.tabBarItem.image = UIImage(named: tabBarImage)
        navCont.navigationBar.isHidden = true
        
        return navCont
    }
    
    override var selectedViewController: UIViewController? {
        willSet {
            lastTabBarIndex = selectedViewController?.view.tag
        }
    }
}

