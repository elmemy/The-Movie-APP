//
//  MoviesListRouter.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 13/08/2021.
//

import UIKit


protocol MoviesListRouter {
    func showDetails(Movie: Movie)
    func sortAction(delegatetypeMovies:getTypeMovies)

}

class MoviesListRouterImplementation: MoviesListRouter {
   
 
    
    fileprivate weak var MoviesListViewController: MoviesListViewController?
    
    init(MoviesListViewController: MoviesListViewController) {
        self.MoviesListViewController = MoviesListViewController
    }
    
    
    func showDetails(Movie: Movie) {
        let configurator = MovieDetailsConfiguratorImplementation()
        let vc = UIStoryboard(name: MainSoryBoard, bundle: nil).instantiateViewController(withIdentifier: MovieDetailsVC) as! MovieDetailsViewController
        configurator.configure(MovieDetailsViewController: vc, movie: Movie)
        self.MoviesListViewController?.show(vc, sender: self)
    }
    
    
    func sortAction(delegatetypeMovies:getTypeMovies) {
        let configurator = SortConfiguratorImplementation()
        let vc = UIStoryboard(name: MainSoryBoard, bundle: nil).instantiateViewController(withIdentifier: SortVc) as! SortViewController
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        configurator.configure(delegatetypeMovies: delegatetypeMovies, SortViewController: vc)
        self.MoviesListViewController?.present(vc, animated: true)
    }
    
    
    
}
