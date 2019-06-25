//
//  movieResults.swift
//  AlamoFireDemo
//
//  Created by Chiu on 2019/6/22.
//  Copyright © 2019年 Chiu. All rights reserved.
//

import Foundation
struct movieResults: Codable{
    struct Movie: Codable{
        var id: Int?
        var title: String?
        var poster_path: String?
        var backdrop_path: String?
        var vote_average: Float?
        var vote_count: Int?
        var release_date: String
        var overview: String?
        var genres_ids: [String]?
    }
    var total_results:Int
    var page:Int
    var results:[Movie]
    var total_pages:Int
}
