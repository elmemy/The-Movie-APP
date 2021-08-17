//
//  MoviesListPresenter.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 13/08/2021.
//

import Foundation
import RealmSwift
protocol MoviesListView: AnyObject {
    
    func showInteractor()
    func hideInteractor()
    func fetchingDataSuccess()
    func showEror(error:String)
    func NoData()
}



protocol MoviesListCellView {
    func displayTitle(name:String)
    func displayRate(rate:String)
    func displayImage(image:String)
}

protocol MoviesListPresenter {
    func viewDidLoad()
    func numberOfRow() -> Int
    func isPagination() -> Bool
    func configure(cell: MoviesListCellView, forRow row: Int)
    func didSelect(index: Int)
    func showSortView()
    
}

class MoviesListPresenterImplementation: MoviesListPresenter, getTypeMovies {
    
    
    fileprivate weak var view: MoviesListView?
    internal let router: MoviesListRouter
    internal let interactor : MoviesListInteractor
    private var movies =  [Movie]()
    
    private var page: Int = 1
    private var isPaginate = true
    var CategoryMovies:String?
    
    init(view: MoviesListView,router: MoviesListRouter,interactor:MoviesListInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
    
    func viewDidLoad() {
        if Connectivity.isConnectedToInternet() {
            if CategoryMovies == CategoryOfMovies.PopularMovies.MoviesType(){
                getPopularMovies()
            }else{
                getTopRated()
            }
        }else{
            getMyFav()
        }
    }
    
    func getTypeMovies(type: String) {
        print(type)
        page = 1
        movies = []
        CategoryMovies = type
        
        if type == CategoryOfMovies.PopularMovies.MoviesType(){
            getPopularMovies()
        }else if type == CategoryOfMovies.TopRated.MoviesType(){
            getTopRated()
        }else if type == CategoryOfMovies.MyFav.MoviesType(){
            getMyFav()
        }
    }
    
    
    func numberOfRow() -> Int {
        return self.movies.count
    }
    
    
    
    
    func getTopRated(){
        self.isPaginate = true
        view?.showInteractor()
        interactor.getTopMovies(page: page){[weak self] data,error in
            guard let self = self else {return}
            self.view?.hideInteractor()
            if let error = error{
                self.view?.showEror(error: error.localizedDescription)
            }else{
                guard let data = data else {return}
                print(self.page)
                self.page += 1
                self.movies += data.movies ?? []
                if self.movies.count == 0{
                    self.view?.NoData()
                }else{
                    self.view?.fetchingDataSuccess()
                }
            }
        }
    }
    
    func getPopularMovies(){
        self.isPaginate = true
        view?.showInteractor()
        interactor.getPopularMovies(page: page){[weak self] data,error in
            guard let self = self else {return}
            self.view?.hideInteractor()
            if let error = error{
                self.view?.showEror(error: error.localizedDescription)
            }else{
                guard let data = data else {return}
                self.page += 1
                self.movies += data.movies ?? []
                if self.movies.count == 0{
                    self.view?.NoData()
                }else{
                    self.view?.fetchingDataSuccess()
                }
            }
        }
    }
    
    
    
    
    func configure(cell: MoviesListCellView, forRow row: Int) {
        let movie = self.movies[row]
        cell.displayTitle(name: movie.title ?? "")
        cell.displayRate(rate: "\(movie.voteAverage)")
        cell.displayImage(image: movie.posterPath ?? "")
    }
    
    func didSelect(index:Int){
        let movie = self.movies[index]
        self.router.showDetails(Movie: movie )
    }
    
    
    
    
    func isPagination() -> Bool {
        return  self.isPaginate
    }
    
    func showSortView() {
        self.router.sortAction(delegatetypeMovies: self)
    }
    
    
    
    func getMyFav() {
        self.isPaginate = false
        
        let realm = try! Realm()
        
        let myFav = realm.objects(Movie.self)
        print(myFav)
        self.movies = Array(myFav)
        if self.movies.count == 0{
            self.view?.NoData()
        }else{
            self.view?.fetchingDataSuccess()
        }
    }
    
    
}
