//
//  TabBarViewController.swift
//  TStoryApp
//
//  Created by Yumin Chu on 2021/10/26.
//

import UIKit

class TabBarViewController: UITabBarController {
    var lastTabBarIndex: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = .none
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        if #available(iOS 15.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = .white
            tabBar.scrollEdgeAppearance = tabBarAppearance
            tabBar.standardAppearance = tabBarAppearance
        }
        else {
            tabBar.backgroundColor = .white
        }
        tabBar.backgroundImage = nil
//        tabBar.delegate = self
//        tabBar.isCustomizing = true
        tabBar.tintColor = .black
//        tabBar.unselectedItemTintColor = .white
        tabBar.isTranslucent = false
        // ex
//        let vc1 = UIViewController()
//        vc1.view.backgroundColor = .white
    
        viewControllers = [
            createTabBarItem(tabBarTitle: nil, tabBarImage: "house.fill", viewController: HomeViewController(), 0),//home
            createTabBarItem(tabBarTitle: nil, tabBarImage: "doc.text", viewController: FeedViewController(), 1),//feed
            createTabBarItem(tabBarTitle: nil, tabBarImage: "plus.square", viewController: WritingFormViewController(), 2),//write
            createTabBarItem(tabBarTitle: nil, tabBarImage: "bell", viewController: NoticeViewController(), 3),//notification
            createTabBarItem(tabBarTitle: nil, tabBarImage: "person.crop.circle", viewController: ProfileViewController(), 4)]//profile
    }
    
    func createTabBarItem(tabBarTitle: String?, tabBarImage: String, viewController: UIViewController, _ tag: Int) -> UINavigationController {
        let navCont = UINavigationController(rootViewController: viewController)
        navCont.view.tag = tag
        navCont.tabBarItem.title = tabBarTitle ?? nil
        navCont.tabBarItem.image = UIImage(systemName: tabBarImage)
        navCont.navigationBar.isHidden = true
        
        return navCont
    }
    
    override var selectedViewController: UIViewController? {
        willSet {
            lastTabBarIndex = selectedViewController?.view.tag
        }
    }
}

