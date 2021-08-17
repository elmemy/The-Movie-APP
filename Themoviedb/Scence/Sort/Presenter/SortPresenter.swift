//
//  SortPresenter.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 15/08/2021.
//

import Foundation
import RealmSwift
protocol SortView: AnyObject {
    
    func showInteractor()
    func hideInteractor()
    func fetchingDataSuccess()
    func showEror(error:String)
    func NoData()
}



protocol SortPresenter {
    func getPopularMovies()
    func getTopRated()
    func getMyFav()

}



protocol getTypeMovies {
    func getTypeMovies (type:String)
}



class SortPresenterImplementation: SortPresenter {
 

    fileprivate weak var view: SortView?
    internal let router: SortRouter
    internal let interactor : SortInteractor
    private var page: Int = 1
    private var isLast: Bool = false
    private var movies: [Movie] = []
    var delegatetypeMovies:getTypeMovies?

    init(view: SortView,router: SortRouter,interactor:SortInteractor,delegatetypeMovies:getTypeMovies?) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.delegatetypeMovies = delegatetypeMovies
    }

 
    func getPopularMovies() {
        self.view?.fetchingDataSuccess()
        self.delegatetypeMovies?.getTypeMovies(type: CategoryOfMovies.PopularMovies.MoviesType())
    }
    
    func getTopRated() {
        self.view?.fetchingDataSuccess()
        self.delegatetypeMovies?.getTypeMovies(type: CategoryOfMovies.TopRated.MoviesType())
    }
    
    
    func getMyFav() {
        self.view?.fetchingDataSuccess()
        self.delegatetypeMovies?.getTypeMovies(type: CategoryOfMovies.MyFav.MoviesType())

    }


}
