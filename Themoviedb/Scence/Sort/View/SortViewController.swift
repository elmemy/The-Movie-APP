//
//  SortViewController.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 15/08/2021.
//

import UIKit
import RealmSwift
final class SortViewController: UIViewController {
    
    var configurator = SortConfiguratorImplementation()
    
    var presenter: SortPresenter?

    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configurator.configure(delegate: getMoviseProtocol, SortViewController: self)
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func popularMoviesAction(_ sender: Any) {
        self.presenter?.getPopularMovies()
    }
    
    @IBAction func topRatedMoviesAction(_ sender: Any) {
        self.presenter?.getTopRated()
    }
    
    @IBAction func myFavAction(_ sender: Any) {
        self.presenter?.getMyFav()
    }
}



extension SortViewController: SortView {
    func showInteractor() {
        self.startAnimating()
    }
    
    func hideInteractor() {
        self.stopAnimating()
    }
    
    func fetchingDataSuccess() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func showEror(error: String) {
        print(error)
        self.stopAnimating()
    }
    
    func NoData() {
        print("NoData")
    }
}
