//
//  NetworkService.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/16.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import Foundation

class NetworkService {
    
    /// 請求的錯誤類型
    enum RequestError: Error {
        
        /// 建立請求失敗
        case createRequestFailed
        
        /// 請求失敗 (錯誤物件)
        case requestFailed(Error)
        
        /// 響應錯誤 (status code)
        case responseError(Int)
        
        var localizedDescription: String {
            switch self {
            case .createRequestFailed:
                return "建立請求失敗，請檢查參數是否正確"
            case .requestFailed(let error):
                return "\(error)"
            case .responseError(let statusCode):
                return "響應發生錯誤，狀態碼為\(statusCode)"
            }
        }
    }
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func sendGetRequest(urlString: String, parameters: [String: Any]?, completion: ((Result<Data?, RequestError>)->Void)?) -> URLSessionTask? {
        let fullUrlStr = urlString.appending(transformToUrlQueryStr(parameters: parameters))
        guard let url = URL(string: fullUrlStr) else {
            completion?(.failure(.createRequestFailed))
            return nil
        }
        let request = URLRequest(url: url)
        return sendRequest(request, completion: completion)
    }
    
    func sendRequest(_ request: URLRequest, completion: ((Result<Data?, RequestError>)->Void)?) -> URLSessionTask {
        let task = session.dataTask(with: request) {
            (data, response, error) in
            
            // error check
            if let error = error {
                completion?(.failure(.requestFailed(error)))
                return
            }
            
            // response check
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                if !(200..<300).contains(statusCode) {
                    completion?(.failure(.responseError(statusCode)))
                    return
                }
            }
            completion?(.success(data))
        }
        task.resume()
        return task
    }
    
    private func transformToUrlQueryStr(parameters: [String: Any]?) -> String {
        guard let params = parameters else {
            return ""
        }
        let urlQueryArray = params.map { "\($0.key)=\($0.value)" }
        return "?\(urlQueryArray.joined(separator: "&"))"
    }
    
    deinit {
        Logger.log(message: "已釋放")
    }
}
