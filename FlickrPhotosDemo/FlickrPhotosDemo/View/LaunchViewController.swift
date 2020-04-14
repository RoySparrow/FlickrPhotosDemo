//
//  LaunchViewController.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/13.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import UIKit

/// Launch 頁，一般有什麼進 app 主頁前要做的事都在這
class LaunchViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.enterMainPage()
        }
    }
    
    private func enterMainPage() {
        guard let parentWindow = view.window else {
            Logger.log(message: "找不到 parent window")
            return
        }
        parentWindow.rootViewController = MainTabBarController()
    }
}

