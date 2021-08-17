//
//  MovieDetailsConfigurator.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 14/08/2021.
//

import Foundation


protocol MovieDetailsConfigurator {
    func configure(MovieDetailsViewController:MovieDetailsViewController)
}


class MovieDetailsConfiguratorImplementation {

    func configure(MovieDetailsViewController:MovieDetailsViewController, movie: Movie) {
        let view = MovieDetailsViewController
        let router = MovieDetailsRouterImplementation(MovieDetailsViewController: view)
        
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenterImplementation(view: view, router: router,interactor:interactor, movie: movie)
        
        
        MovieDetailsViewController.presenter = presenter
    }
    
}
