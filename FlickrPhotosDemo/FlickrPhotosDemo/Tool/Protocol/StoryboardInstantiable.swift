//
//  StoryboardInstantiable.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/13.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import UIKit

/**
 可透過 Storyboard 實體化 UIViewController。預設類別名 = Storyboard 名稱 = 唯一辨識 Identifier
 */
protocol StoryboardInstantiable: UIViewController {
    static var storyboardName: String { get }
    static var storyboardIdentifier: String { get }
}

/// 預設實現
extension StoryboardInstantiable {
    
    static var storyboardName: String {
        return String(describing: self)
    }
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    /// 取得實體並與 Storyboard 綁定
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: storyboardIdentifier) as? Self else {
            fatalError("請檢查 Storyboard 是否被正確地設定。")
        }
        return vc
    }
}
