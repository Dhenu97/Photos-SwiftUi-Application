//
//  PhotosModel.swift
//  Photos Project
//
//  Created by dhenu on 3/22/24.
//

import Foundation

struct Photo: Identifiable, Decodable {
    let id: Int
    let url: String
    let title: String
    let description: String
}

