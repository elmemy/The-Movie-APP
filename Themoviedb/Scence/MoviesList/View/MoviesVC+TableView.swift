//
//  MoviesVC+TableView.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 13/08/2021.
//

import UIKit

extension MoviesListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.register(UINib(nibName: MoviesCell, bundle: nil), forCellReuseIdentifier: MoviesCell)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.numberOfRow())!
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesCell, for: indexPath) as! MovieCell
        self.presenter?.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.didSelect(index: indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0
    }
    
   
    
    
    
    
}

extension MoviesListViewController: UITableViewDataSourcePrefetching {
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    if indexPaths.contains(where: isLoadingCell) {
        self.presenter?.viewDidLoad()
    }
  }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        if let count = self.presenter?.numberOfRow()   {
            return   indexPath.row >= count - 4 && self.presenter!.isPagination()
        }
        return false
    }
}
