//
//  DetailMovieModel.swift
//  movie_example_barrueta
//
//  Created by Jonathan hugo Barrueta Aguilar on 14/03/24.
//

import Foundation

struct DetailMovieModel:Codable{
    let genres:[genres]
    let id:Int
    let overview:String
    let poster_path:String
    let release_date:String
    let title:String
}

struct genres:Codable{
    let id:Int
    let name:String
}
