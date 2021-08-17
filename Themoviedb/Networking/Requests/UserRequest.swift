//
//  ProjectRouter.swift
//  SwiftCairo-App
//
//  Created by abdelrahman mohamed on 4/21/18.
//  Copyright © 2018 abdelrahman mohamed. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestBuilder {

    case login(email: String, password: String)
    case register(email: String, password: String, phone: String)
    case topRated(page:Int)
    case popularMovies(page:Int)
    case getMovieDetails(id:String)

    // MARK: - Path
    internal var path: String {
        switch self {
        case .login:
            return "login"
        case .register:
            return "register"
        case .topRated:
            return "top_rated"
        case .getMovieDetails(let id):
            return id
        case .popularMovies:
            return "popular"
        }
        
    }

    // MARK: - Parameters
    internal var parameters: Parameters? {
        var params = Parameters.init()
        switch self {
        case .login(let email, let password):
            params["email"] = email
            params["password"] = password
        case .register(let email, let password, let phone):
            params["email"] = email
            params["password"] = password
            params["phone"] = phone
        case .topRated(let page):
            params["api_key"] = apiKey
            params["page"] = page
        case .getMovieDetails(id: _):
            params["api_key"] =  apiKey
        case .popularMovies(page: let page):
            params["api_key"] =  apiKey
            params["page"] = page
        }
        
        return params
    }
    
    // MARK: - Methods
    internal var method: HTTPMethod {
        switch self {
        case .topRated,.getMovieDetails,.popularMovies:
        return .get
            
            
        default:
            return .post
        }
        
    }
    
    
    
   
}
