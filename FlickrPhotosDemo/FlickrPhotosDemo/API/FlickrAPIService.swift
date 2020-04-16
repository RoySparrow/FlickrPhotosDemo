//
//  FlickrAPIService.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/16.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import Foundation

class FlickrAPIService {
    
    enum ErrorType: Error {
        
        /// Flickr service 回傳的錯誤 response
        case flickrErrorResponse(FlickrErrorResponse)
        
        /// 其他錯誤
        case otherError(Error)
        
        var localizedDescription: String {
            switch self {
            case .flickrErrorResponse(let errorResponse):
                return "Flickr 回傳錯誤：\(errorResponse.message ?? "")"
            case .otherError(let error):
                return error.localizedDescription
            }
        }
    }
    
    private let defaultAPIKey = "8ee9c35fe02e087105df57f8c90f28c2"
    
    private lazy var networkService: NetworkService = {
        return NetworkService()
    }()
    
    private lazy var apiKey: String = {
        let helper = UserDefaultsHelper()
        if let apiKey = helper.getString(forKey: UserDefaultsHelper.flickrAPIKey) {
            return apiKey
        }
        return defaultAPIKey
    }()
    
    func photoSearchWithText(_ text: String,
                             numPerPage perPage: Int,
                             completion: ((FlickrPhotoSearchResponse?, ErrorType?)->Void)?) -> URLSessionTask? {
        let urlString = "https://www.flickr.com/services/rest/"
        var params: [String: Any] = [:]
        params["method"] = "flickr.photos.search"
        params["api_key"] = apiKey
        params["text"] = text
        params["per_page"] = perPage
        params["format"] = "json"
        return sendRequest(urlString: urlString, parameters: params, completion: completion)
    }
    
    private func sendRequest<T: ResponseBase>(urlString: String,
                                              parameters: [String: Any],
                                              completion: ((T?, ErrorType?)->Void)?) -> URLSessionTask? {
        return networkService.sendGetRequest(urlString: urlString, parameters: parameters) {
            (result) in
            switch result {
            case .success(let jsonData):
                if let jsonData = jsonData {
                    let decoder = JSONDecoder()
                    do {
                        let data = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                        let response = try decoder.decode(T.self, from: data)
                        completion?(response, nil)
                    } catch {
                        completion?(nil, .otherError(error))
                    }
                } else {
                    completion?(nil, nil)
                }
            case .failure(let error):
                completion?(nil, .otherError(error))
            }
        }
    }
    
    deinit {
        Logger.log(message: "已釋放")
    }
}

