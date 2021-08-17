//
//  MoviesListInteractor.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 13/08/2021.
//

import Foundation

 class MoviesListInteractor {
    
    func getTopMovies(page:Int,completionHandler: @escaping (MoviesModel?, Error?) -> ()) {

        var itemResponse: CallResponse<MoviesModel> {
            return {[weak self] (response) in
                switch response {
                case .failure(let error):
                    completionHandler(nil, error)
                case .success(let movies):
                    completionHandler(movies, nil)
                }
            }
        }
      
            // creating request with the builder enum
   
        APIRouter.topRated(page: page).send(MoviesModel.self, then: itemResponse)
    }
    
    
    func getPopularMovies(page:Int,completionHandler: @escaping (MoviesModel?, Error?) -> ()) {

        var itemResponse: CallResponse<MoviesModel> {
            return {[weak self] (response) in
                switch response {
                case .failure(let error):
                    completionHandler(nil, error)
                case .success(let movies):
                    completionHandler(movies, nil)
                }
            }
        }
      
            // creating request with the builder enum
   
        APIRouter.popularMovies(page: page).send(MoviesModel.self, then: itemResponse)
    }
    
    
 

 }
