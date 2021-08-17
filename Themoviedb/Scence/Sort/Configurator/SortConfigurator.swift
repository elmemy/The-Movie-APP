//
//  SortConfigurator.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 15/08/2021.
//

import Foundation


protocol SortConfigurator {
    func configure(SortViewController:SortViewController)
}


class SortConfiguratorImplementation {

    func configure(delegatetypeMovies:getTypeMovies,SortViewController:SortViewController) {
        let view = SortViewController
        let router = SortRouterImplementation(SortViewController: view)
        
        let interactor = SortInteractor()
        let presenter = SortPresenterImplementation(view: view, router: router,interactor:interactor, delegatetypeMovies: delegatetypeMovies)
        
        SortViewController.presenter = presenter
    }
    
}
