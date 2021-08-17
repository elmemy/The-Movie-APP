//
//  MoviesModel.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 13/08/2021.
//

import Foundation
import RealmSwift
// MARK: - MoviesModel
struct MoviesModel: Codable,CodableInit {
    let page: Int?
    let movies: [Movie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Movie
class Movie: Object, Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let originalLanguage, originalTitle: String?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteCount: Double?
    @objc dynamic var posterPath:String?
    @objc dynamic var overview:String?
    @objc dynamic var id: Int = 0
    @objc dynamic var voteAverage: Double = 0.0
    @objc dynamic var title:String?
    @objc dynamic var tagline:String?
}
