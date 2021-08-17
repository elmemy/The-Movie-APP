//
//  MovieDetailsInteractor.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 14/08/2021.
//

import Foundation

 class MovieDetailsInteractor {
    
    
    func getMovieDetails(id:String,completionHandler: @escaping (MovieDetailsModel?, Error?) -> ()) {

        var itemResponse: CallResponse<MovieDetailsModel> {
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
   
        APIRouter.getMovieDetails(id: id).send(MovieDetailsModel.self, then: itemResponse)

    }
 }
