//
//  JsonSource.swift
//  Eval5Final
//
//  Created by Student04 on 10/11/2021.
//

import Foundation
import UIKit

struct Source :Codable {
    
    let page : Int?
    let results : [Result]?
    let totalPages : Int?
    let totalResults : Int?
    
    enum CodingKeys:String, CodingKey{
        case page
        case results
       case totalPages = "total_pages"
       case totalResults = "total_results"
    }
    
    
}

struct Result : Codable{
        let adult : Bool?
        let backDropPath : String?
        let genreIds :[Int]?
        let id : Int?
        let popularity : Double?
        let posterPath : String?
        let releaseDate : String?
        let title : String?
        let voteAverage : Double?
        let voteCount : Int?
              
        enum CodingKeys:String, CodingKey{
            case popularity
            case adult
            case backDropPath = "backdrop_path"
            case genreIds = "genre_ids"
            case id
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
                  
            
            
            
            
        }
}

