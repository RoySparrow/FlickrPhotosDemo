//
//  Logger.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/13.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import Foundation

/// 簡易版印 log 工具
class Logger {
    
    /// 輸出訊息
    public static func log<T>(message: T, file: String = #file, method: String = #function) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName): \(method)] \(message)")
        #endif
    }
}
