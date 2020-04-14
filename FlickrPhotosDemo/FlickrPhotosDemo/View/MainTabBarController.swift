//
//  MainTabBarController.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/13.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    private enum TabPageType: Int, CustomStringConvertible, CaseIterable {
        case search = 0
        case favorite = 1
        
        var description: String {
            switch self {
            case .search:
                return "搜尋頁"
            case .favorite:
                return "我的最愛"
            }
        }
        
        var getVC: UIViewController {
            switch self {
            case .search:
                return SearchViewController.instantiate()
            case .favorite:
                return UIViewController()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
    }
    
    private func initLayout() {
        var tabPageVCs: [UIViewController] = []
        for type in TabPageType.allCases {
            let vc = type.getVC
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.tabBarItem = UITabBarItem(title: type.description, image: nil, selectedImage: nil)
            tabPageVCs.append(navigationController)
        }
        viewControllers = tabPageVCs
    }
}
