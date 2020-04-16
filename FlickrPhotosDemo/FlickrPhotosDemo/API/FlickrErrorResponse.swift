//
//  FlickrErrorResponse.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/16.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import Foundation

/// Flickr 回傳錯誤的 response 結構
struct FlickrErrorResponse: ResponseBase {
    let stat: String?
    let code: Int?
    let message: String?
}
