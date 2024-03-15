//
//  NowPlayingViewModel.swift
//  movie_example_barrueta
//
//  Created by Jonathan hugo Barrueta Aguilar on 14/03/24.
//

import Foundation
@MainActor
class NowPlayingViewModel:ObservableObject{
    @Published var nowplaying :[result] = []
    func fethc() async{
        do{
            let urlString = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1&api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
            guard let url = URL(string:urlString) else {return}
            let (data,_) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(NowPlayingModel.self, from: data)
            self.nowplaying = json.results
            print(json.results)
        }catch let error as NSError{
            print("error en la api",error.localizedDescription)
        }
    }
}
