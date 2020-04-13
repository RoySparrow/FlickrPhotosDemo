//
//  SearchViewController.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/13.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        Logger.log(message: "已釋放")
    }
}

extension SearchViewController: StoryboardInstantiable {}
