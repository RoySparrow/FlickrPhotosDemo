//
//  StringExtension.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/14.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import Foundation

extension String {
    
    /// 判斷是不是空字串或 nil
    static func isEmptyOrNil(_ originalStr: String?) -> Bool {
        if let str = originalStr {
            return str == ""
        }
        return true
    }
}
