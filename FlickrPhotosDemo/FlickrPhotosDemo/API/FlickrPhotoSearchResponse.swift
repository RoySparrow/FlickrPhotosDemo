//
//  FlickrPhotoSearchResponse.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/16.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import Foundation

struct FlickrPhotoSearchResponse: ResponseBase {
    let stat: String?
    let photos: FlickrPhotoListAPIData?
}

struct FlickrPhotoListAPIData: Decodable {
    let page: Int?
    let pages: Int?
    let perpage: Int?
    let total: String?
    let photo: [FlickrPhotoAPIData]?
}

struct FlickrPhotoAPIData: Decodable {
    let id: String?
    let owner: String?
    let secret: String?
    let server: String?
    let farm: Int?
    let title: String?
    let ispublic: Int?
    let isfriend: Int?
    let isfamily: Int?
}
