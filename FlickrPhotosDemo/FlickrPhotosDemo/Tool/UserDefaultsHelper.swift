//
//  UserDefaultsHelper.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/16.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import Foundation

/// UserDefaults 小幫手
class UserDefaultsHelper {
    
    /// 存放 Flickr API Key 的 key
    static let flickrAPIKey = "flickrAPIKey"
    
    func getString(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    deinit {
        Logger.log(message: "已釋放")
    }
}
