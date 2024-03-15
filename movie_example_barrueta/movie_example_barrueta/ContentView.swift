//
//  ContentView.swift
//  movie_example_barrueta
//
//  Created by Jonathan hugo Barrueta Aguilar on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nowPlaying = NowPlayingViewModel()
    var body: some View {
        ZStack (alignment: .top) {
            VStack{
                headerBackground
                Spacer()
            }.task {
                await nowPlaying.fethc()
            }
            
            VStack{
                ScrollView(.horizontal){
                        HStack(spacing:20){
                            ForEach(nowPlaying.nowplaying, id:\.id){value in
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(value.poster_path)")){image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .shadow(radius:5)
                                        .frame(width: 100)
                                }placeholder: {
                                Image("avaible")
                                }
                        }
                    }
            }
            }
          
        }
    }
}

#Preview {
    ContentView()
}


var headerBackground : some View{
    Rectangle()
        .fill(LinearGradient(
            colors:
                [
                    Color(red:9/255 , green:9/255 ,blue:9/255 ),
                    Color(red:9/255 , green:9/255 ,blue:9/255 ),
                    Color(red:40/255 , green:92/255 ,blue:222/255 )
                ],
            startPoint: .bottom, endPoint: .top))
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .edgesIgnoringSafeArea(.top)
}
