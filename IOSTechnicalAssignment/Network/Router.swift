//
//  Router.swift
//  IOSTechnicalAssignment
//
//  Created by Andre Lemos on 2025-03-27.
//

import Alamofire
import Foundation

enum Router {
    case curatedPhotos(page: String)
    
    var baseURL: URL {
        URL(string: API.url)!
    }
    
    var path: String {
        switch self {
        case .curatedPhotos:
            return API.Path.curatedPhotos
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .curatedPhotos:
            return .get
        }
    }
    
    var parameters: [String: String]  {
        var parameters: [String: String] = [:]

        switch self {
        case let .curatedPhotos(page):
            parameters[API.DefaultValue.perPage] = page
            break
        }
        
        return parameters
    }

}

extension Router: URLRequestConvertible {
  func asURLRequest() throws -> URLRequest {
    
      let url = baseURL.appendingPathComponent(path)
      
      var request = URLRequest(url: url)
      request.httpMethod = method.rawValue
      request.timeoutInterval = API.DefaultValue.timeOut
      request.addValue(API.Headers.applicationJson, forHTTPHeaderField: API.Headers.contentType)
      request.addValue(API.Headers.apiKey, forHTTPHeaderField: API.Headers.authorization)
      return try URLEncoding.default.encode(request,with: parameters)
  }
}

