//
//  ContentView.swift
//  movie_example_barrueta
//
//  Created by Jonathan hugo Barrueta Aguilar on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nowPlaying = NowPlayingViewModel()
    @StateObject var movie = MovieViewModel()
    @State var progressValue:Float = 0.0
    var body: some View {
        ZStack (alignment: .top) {
            VStack{
                headerBackground
                Spacer()
            }.task {
                await nowPlaying.fethc()
                await movie.fethc(page: 1)
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
                .padding()
                NavigationView{
                    List(movie.movie, id:\.id){ item in
                        NavigationLink(
                            destination: DetailMovieView(),label: {
                                VStack(alignment:.leading){
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(item.poster_path)")){image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .shadow(radius:5)
                                            .frame(width: 100)
                                    }placeholder: {
                                    Image("avaible")
                                    }
                                    Spacer()
                                    Text(item.title)
                                    Spacer()
                                    Text(item.release_date)
                                    Spacer()
                                    Text("example")
                                    Spacer()
                                    ProgessBar(porgess: self.$progressValue)
                                        .frame(width: 50.0,height: 50.0)
                                        .padding(20.0).onAppear() {
                                            self.progressValue = item.vote_average
                                        }
                                    Text("\(progressValue)%")
                                }
                            })
                        .navigationTitle("Peliculas populares")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ProgessBar:View {
    @Binding var porgess:Float
    var color:Color = Color.green
    var body: some View {
        ZStack{
            if(porgess <= 50.0){
                Circle()
                    .stroke(lineWidth: 10.0)
                    .opacity(0.20)
                    .foregroundColor(Color.gray)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.porgess,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 12.0,lineCap: .round,lineJoin: .round))
                    .foregroundColor(Color.yellow)
                    .rotationEffect(Angle(degrees: 270))
                    
            }
            else if (porgess >= 51.0){
                Circle()
                    .stroke(lineWidth: 10.0)
                    .opacity(0.20)
                    .foregroundColor(Color.gray)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.porgess,1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 12.0,lineCap: .round,lineJoin: .round))
                    .foregroundColor(Color.green)
                    .rotationEffect(Angle(degrees: 270))
                   
            }
        }
    }
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
