//
//  MovieData.swift
//  MovieDataBase MdevData
//
//  Created by New Group4 on 2023-11-23.
//

import Foundation
import UIKit

struct MovieData: Codable {
    let movieID: Int
    let title: String
    let studio: String
    let genres: String
    let directors: String
    let writers: String
    let actors: String
    let year: Int
    let length: Int
    let movieDescription: String
    let mpaRating: String
    let criticsRating: Double
}
