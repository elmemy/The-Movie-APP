//
//  CategoryMovies.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 16/08/2021.
//

import Foundation

enum CategoryOfMovies:String {
    case PopularMovies
    case TopRated
    case MyFav
    
    func MoviesType() -> String {
        switch self {
        case .PopularMovies:
            return  "PopularMovies"
        case .TopRated:
            return "TopRated"
        case .MyFav:
            return "MyFav"
        default:
            return "PopularMovies"
        }
    }
}
