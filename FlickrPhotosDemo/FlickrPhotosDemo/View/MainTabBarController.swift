//
//  MainTabBarController.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/13.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    private enum TabPageType: Int, CustomStringConvertible {
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
