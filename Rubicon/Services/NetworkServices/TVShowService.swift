//
//  TVShowService.swift
//  Rubicon
//
//  Created by Pavle on 15.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import Alamofire
class TVShowService: BaseConfiguration {
    
    func getTopRatedTVShows(succeededRequest: @escaping (TvShowsApiResponse)->(), failedRequest: @escaping (Error) -> ()){
        let baseNetworkService = BaseNetworkService.init(config: self)
        var params:[String: Any] = [:]
        params = ["api_key":"72f55c16869bd538f34e82cd2a794a44"]
        
        let request: URLRequest = baseNetworkService.buildRequest(path: "tv/top_rated", method: .get, encoding: URLEncoding.default, params: params)
        baseNetworkService.execute(request: request).responseObject {(response: DataResponse<TvShowsApiResponse> ) -> Void in
            if let _error = response.error{
                failedRequest(_error)
            }
            //these two are exclusively
            if let _error = response.result.error{
                failedRequest(_error)
            }
            if let _value = response.value{
                succeededRequest(_value)
            }
        }
    }
    
    func getTvShowById(id: Int, succeededRequest: @escaping (ApiTVShows)->(), failedRequest: @escaping (Error) -> ()){
        let baseNetworkService = BaseNetworkService.init(config: self)
        var params:[String: Any] = [:]
        params = ["api_key":"72f55c16869bd538f34e82cd2a794a44"]
        let request: URLRequest = baseNetworkService.buildRequest(path: "/tv/" + "\(id)" , method: .get, encoding: URLEncoding.default, params: params)
        baseNetworkService.execute(request: request).responseObject {(response: DataResponse<ApiTVShows>) -> Void in
            
            if let _error = response.error{
                failedRequest(_error)
            }
            //these two are exclusively
            if let _error = response.result.error{
                failedRequest(_error)
            }
            
            if let _value = response.value{
                succeededRequest(_value)
            }
        }
    }
    
    func getTVShowsByQuery(query: String, succeededRequest: @escaping (TvShowsApiResponse)->(), failedRequest: @escaping (Error) -> ()){
        let baseNetworkService = BaseNetworkService.init(config: self)
        var params:[String: Any] = [:]
        params = ["api_key" : "72f55c16869bd538f34e82cd2a794a44", "query" : query]
        
        let request: URLRequest = baseNetworkService.buildRequest(path: "/search/tv/", method: .get, encoding: URLEncoding.default, params: params)
        baseNetworkService.execute(request: request).responseObject {(response: DataResponse<TvShowsApiResponse> ) -> Void in
            if let _error = response.error{
                failedRequest(_error)
            }
            //these two are exclusively
            if let _error = response.result.error{
                failedRequest(_error)
            }
            if let _value = response.value{
                succeededRequest(_value)
            }
        }
    }
    
}
