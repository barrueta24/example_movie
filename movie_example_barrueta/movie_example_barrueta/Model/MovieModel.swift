//
//  MovieModel.swift
//  movie_example_barrueta
//
//  Created by Jonathan hugo Barrueta Aguilar on 14/03/24.
//

import Foundation

struct MovieModel:Codable{
    let page:Int
    let results: [resultsMovie]
}

struct resultsMovie:Codable{
    let id: Int
    let poster_path:String
    let vote_average:Float
    let release_date:String
    let title:String
}


