//
//  DetailViewModel.swift
//  movie_example_barrueta
//
//  Created by Jonathan hugo Barrueta Aguilar on 14/03/24.
//

import Foundation

@MainActor
class DetailViewModel:ObservableObject{
    @Published var detailMovie = DetailMovieModel(genres:[], id:0, overview: "", poster_path: "", release_date: "", title: "")
    func fethc(id:Int) async{
        do{
            let urlString = "https://api.themoviedb.org/3/movie/\(id)?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US"
            print("urlDetailPRODUCTO \(urlString)")
            guard let url = URL(string:urlString) else {return}
            let (data,_) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(DetailMovieModel.self, from: data)
            self.detailMovie = json
            print(json)
        }catch let error as NSError{
            print("error en la api",error.localizedDescription)
        }
    }
    
}
