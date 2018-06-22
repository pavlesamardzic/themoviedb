//
//  MovieService.swift
//  Rubicon
//
//  Created by Pavle on 19.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import Alamofire

class MovieService: BaseConfiguration {
    
    func getTopRatedMovies(succeededRequest: @escaping (MoviesApiResponse)->(), failedRequest: @escaping (Error) -> ()){
        let baseNetworkService = BaseNetworkService.init(config: self)
        var params:[String: Any] = [:]
        params = ["api_key":"72f55c16869bd538f34e82cd2a794a44"]
        
        let request: URLRequest = baseNetworkService.buildRequest(path: "/movie/top_rated", method: .get, encoding: URLEncoding.default, params: params)
        baseNetworkService.execute(request: request).responseObject {(response: DataResponse<MoviesApiResponse>) -> Void in
            
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
    
    func getMovieById(id: Int, succeededRequest: @escaping (ApiMovie)->(), failedRequest: @escaping (Error) -> ()){
        let baseNetworkService = BaseNetworkService.init(config: self)
        var params:[String: Any] = [:]
        params = ["api_key":"72f55c16869bd538f34e82cd2a794a44"]
        let request: URLRequest = baseNetworkService.buildRequest(path: "/movie/" + "\(id)" , method: .get, encoding: URLEncoding.default, params: params)
        baseNetworkService.execute(request: request).responseObject {(response: DataResponse<ApiMovie>) -> Void in
            
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
    
    func getMoviesByQuery(query: String, succeededRequest: @escaping (MoviesApiResponse)->(), failedRequest: @escaping (Error) -> ()){
        let baseNetworkService = BaseNetworkService.init(config: self)
        var params:[String: Any] = [:]
        params = ["api_key" : "72f55c16869bd538f34e82cd2a794a44", "query" : query]
        
        let request: URLRequest = baseNetworkService.buildRequest(path: "search/movie/", method: .get, encoding: URLEncoding.default, params: params)
        baseNetworkService.execute(request: request).responseObject {(response: DataResponse<MoviesApiResponse>) -> Void in
            
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
