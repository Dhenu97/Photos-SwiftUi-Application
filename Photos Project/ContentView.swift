//
//  ContentView.swift
//  Photos Project
//
//  Created by dhenu on 3/22/24.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var photoFetcher = PhotoFetcher()

  var body: some View {
          NavigationView {
              List(photoFetcher.photos) { photo in
                  VStack(alignment: .leading) {
                      Text(photo.title)
                          .font(.headline)
                      AsyncImage(url: URL(string: photo.url)) { phase in
                          switch phase {
                          case .empty:
                              ProgressView()
                          case .success(let image):
                              image
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                          case .failure:
                              Image(systemName: "photo")
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                          @unknown default:
                              EmptyView()
                          }
                      }
                      .frame(height: 200)
                  }
              }
              .navigationTitle("Photos")
          }
      }
  }

#Preview {
    ContentView()
}
