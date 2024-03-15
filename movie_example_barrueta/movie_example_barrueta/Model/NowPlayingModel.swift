//
//  nowPlayingModel.swift
//  movie_example_barrueta
//
//  Created by Jonathan hugo Barrueta Aguilar on 14/03/24.
//

import Foundation

struct NowPlayingModel:Codable{
    let page: Int
    let results: [result]
}


struct result: Codable,Identifiable {
    let id: Int
    let poster_path:String
}
