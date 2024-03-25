//
//  ApiRequest.swift
//  Photos Project
//
//  Created by dhenu on 3/22/24.
//

import Foundation
import UIKit


struct PhotoResponse: Decodable {
    let photos: [Photo]
}


class PhotoFetcher: ObservableObject {
    @Published var photos: [Photo] = []

    init() {
        fetchData()
    }

    func fetchData() {
        guard let url = URL(string: "https://api.slingacademy.com/v1/sample-data/photos") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(PhotoResponse.self, from: data)
                DispatchQueue.main.async {
                    self.photos = responseData.photos
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
