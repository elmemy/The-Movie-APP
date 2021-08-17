//
//  MoviesListViewController.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 13/08/2021.
//

import UIKit

final class MoviesListViewController: UIViewController{
 
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataImage: UIImageView!

    
    var configurator = MoviesListConfiguratorImplementation()
    
    var presenter: MoviesListPresenter?
    
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(MoviesListViewController: self)
        presenter?.viewDidLoad()
        setupTableView()

        self.navigationController?.navigationBar.isHidden = true
    }
    
    

    
    @IBAction func sortAction(_ sender: Any) {
        self.presenter?.showSortView()
    }
}



extension MoviesListViewController: MoviesListView{
   
    
    func showInteractor() {
//        self.startAnimating()
    }
    
    
    func hideInteractor() {
//        self.stopAnimating()
    }
    
    func fetchingDataSuccess() {
        self.noDataImage.isHidden = true
        self.tableView.reloadData()
    }
    
    
    func showEror(error: String) {
//        self.stopAnimating()
        print(error)
    }
    
    
 
    
    func NoData() {
        self.noDataImage.isHidden = false
        self.tableView.reloadData()
    }
}

