//
//  MovieDetailsRouter.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 14/08/2021.
//

import UIKit


protocol MovieDetailsRouter {
  
}

class MovieDetailsRouterImplementation: MovieDetailsRouter {
    fileprivate weak var MovieDetailsViewController: MovieDetailsViewController?
    
    init(MovieDetailsViewController: MovieDetailsViewController) {
        self.MovieDetailsViewController = MovieDetailsViewController
    }
    
    
}
