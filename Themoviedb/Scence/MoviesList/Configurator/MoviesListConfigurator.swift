//
//  MoviesListConfigurator.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 13/08/2021.
//

import Foundation


protocol MoviesListConfigurator {
    func configure(MoviesListViewController:MoviesListViewController)
}


class MoviesListConfiguratorImplementation {

    func configure(MoviesListViewController:MoviesListViewController) {
        let view = MoviesListViewController
        let router = MoviesListRouterImplementation(MoviesListViewController: view)
        
        let interactor = MoviesListInteractor()
        let presenter = MoviesListPresenterImplementation(view: view, router: router,interactor:interactor)
        
        
        MoviesListViewController.presenter = presenter
    }
    
}
