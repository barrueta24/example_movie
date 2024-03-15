//
//  DetailMovieView.swift
//  movie_example_barrueta
//
//  Created by Jonathan hugo Barrueta Aguilar on 14/03/24.
//

import SwiftUI

struct DetailMovieView: View {
    @StateObject var detailMovie = DetailViewModel()
    var ids:Int
    var body: some View {
        VStack{}.task {await detailMovie.fethc(id: ids)}
        VStack{
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(detailMovie.detailMovie.poster_path)")){image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius:5)
                        .frame(width: 100)
                }placeholder: {
                Image("avaible")
                }
                HStack{
                    Text("Titulo:")
                    Text(detailMovie.detailMovie.title)
                }
                
                HStack{
                    Text("Fecha de estreno:")
                    Text(detailMovie.detailMovie.release_date)
                }
                
                    Text("Resumen")
            Text(detailMovie.detailMovie.overview)
                    .padding()
            
            
            HStack{
                Text("Generos:")
                ScrollView(.horizontal){
                        HStack(spacing:10){
                            ForEach((detailMovie.detailMovie.genres), id: \.id) { item in
                                Text(item.name)
                               }
                        }
                        
                    }
                
            }
            
        }
        
    
    }
       

}
        
        
    



