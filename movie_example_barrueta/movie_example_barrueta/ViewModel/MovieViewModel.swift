//
//  MovieViewModel.swift
//  movie_example_barrueta
//
//  Created by Jonathan hugo Barrueta Aguilar on 14/03/24.
//

import Foundation

@MainActor
class MovieViewModel:ObservableObject{
    @Published var movie :[resultsMovie] = []
    func fethc(page:Int) async{
        do{
            let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=\(page)"
            guard let url = URL(string:urlString) else {return}
            let (data,_) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(MovieModel.self, from: data)
            self.movie = json.results
            print(json.results)
        }catch let error as NSError{
            print("error en la api",error.localizedDescription)
        }
    }
}
