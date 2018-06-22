//
//  BaseNetworkService.swift
//  Rubicon
//
//  Created by Pavle on 20.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class BaseNetworkService {
    
    var config: ApiConfiguration
    
    init(config: ApiConfiguration) {
        self.config = config
    }
    
    func execute(request: URLRequest) -> DataRequest {
        return NetworkManager.shared.request(request).validate()
    }
    
    func executeWithoutValidation(request: URLRequest) -> DataRequest{
        return NetworkManager.shared.request(request)
    }
    
    func buildRequest(path: String, method: HTTPMethod, encoding: ParameterEncoding, params: Parameters? = nil) -> URLRequest {
        let url = createUrl(config.url)
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        do {
            urlRequest = try encoding.encode(urlRequest, with: params)
        } catch _ {
            print("Failed encoding of params")
        }
        
        return urlRequest
    }
    
    private func createUrl(_ fromUrl: String) -> URL{
        if let _url = URL(string: fromUrl){
            return _url
        }
        return URL(fileURLWithPath: "") // this should never happend
    }
}
