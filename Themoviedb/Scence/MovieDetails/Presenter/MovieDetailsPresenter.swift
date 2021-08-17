//
//  MovieDetailsPresenter.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 14/08/2021.
//

import Foundation
import RealmSwift

protocol MovieDetailsView: AnyObject {
    func showInteractor()
    func hideInteractor()
    func showEror(error:String)
    func NoData()
    func isFav(isFav:Bool)
    func displayTitle(title:String)
    func displayImage(image:String)
    func displayDesc(Desc:String)
    func displayTagline(Tagline:String)
}



protocol MovieDetailsPresenter {
    func viewDidLoad()
    func isFav()
    func checkIsFav()    
}

class MovieDetailsPresenterImplementation: MovieDetailsPresenter {

    fileprivate weak var view: MovieDetailsView?
    internal let router: MovieDetailsRouter
    internal let interactor : MovieDetailsInteractor
    private let movie: Movie
    
    var movieDetails: MovieDetailsModel?
    
    
    init(view: MovieDetailsView,router: MovieDetailsRouter,interactor:MovieDetailsInteractor,movie:Movie) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.movie = movie
    }
    
    
    func viewDidLoad() {
        getData()
        print(movie.id)
    }
    
    
    
    
    func getData(){
        view?.showInteractor()
        interactor.getMovieDetails(id: "\(movie.id)"){[weak self] data,error in
            guard let self = self else {return}
            self.view?.hideInteractor()
            if let error = error{
                self.view?.showEror(error: error.localizedDescription)
            }else{
                guard let data = data else {return}
                self.movieDetails = data
                if self.movieDetails?.id == nil{
                    self.view?.NoData()
                }else{
                    self.view?.displayTitle(title: self.movieDetails?.title ?? "")
                    self.view?.displayDesc(Desc: self.movieDetails?.overview ?? "")
                    self.view?.displayTagline(Tagline: self.movieDetails?.tagline ?? "")
                    self.view?.displayImage(image: (URLs.BaseImage + (self.movieDetails?.posterPath ?? "")))
                }
            }
        }
    }
    
    
    
    func isFav() {
        let realm = try! Realm()
        let myFav = realm.objects(Movie.self).filter({ return ($0.id == self.movieDetails!.id)})
        if myFav.count == 0{
            let myFavmovie = Movie()
            print(realm.configuration.fileURL!)
            myFavmovie.id = movieDetails?.id ?? 0
            myFavmovie.title = movieDetails?.title ?? ""
            myFavmovie.tagline = movieDetails?.tagline ?? ""
            myFavmovie.overview = movieDetails?.overview ?? ""
            myFavmovie.posterPath = (URLs.BaseImage + (movieDetails?.posterPath ?? ""))
            myFavmovie.voteAverage = movieDetails?.voteAverage ?? 0.0
            try! realm.write {
                realm.add(myFavmovie)
                self.view?.isFav(isFav: true)
            }
        }else{
            try! realm.write {
                realm.delete(myFav.first!)
                self.view?.isFav(isFav: false)
            }
            
        }
        
    }
    
    
    func checkIsFav() {
        let realm = try! Realm()
        
        let myFav = realm.objects(Movie.self).filter({ return ($0.id == self.movie.id)})
        if myFav.count == 0{
            self.view?.isFav(isFav: false)
        }else{
            self.view?.isFav(isFav: true)
        }
    }
    
    
    
    
    
    
}
