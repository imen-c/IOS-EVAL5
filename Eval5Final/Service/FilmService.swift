//
//  FilmService.swift
//  Eval5Final
//
//  Created by Student04 on 10/11/2021.
//

import Foundation
import Network
import Alamofire
typealias FilmCompletionHandler = ([Result]?) -> Void
typealias TopCompletionHandler = ([Result]?) -> Void

class FilmService{
    static let shared = FilmService()
     let APIToken = "b2168bae3a2c67509eb6b97572f521c2"
    var queryRecup: String?
    
    func getQuery(query: String){
        queryRecup = query
    }
    func getFilmSearched(completionHandler : @escaping FilmCompletionHandler){
        
        let parameters: Parameters = [
            "language": "en-US",
            "Query": queryRecup,
            "api_key": APIToken
        ]
        AF.request("https://api.themoviedb.org/3/search/movie",parameters : parameters)
        .responseJSON{ dataResponse in
            switch dataResponse.result {
            case .success:
                if let data = dataResponse.data {
                    print("DATA FROM SERVER: \(data)")
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let filmJSON = try! jsonDecoder.decode(Source.self, from: data)
                    let films = filmJSON.results
                    
                    completionHandler(films)
                    print("RECUP DES DONNES AVEC SUCCES")
                    
                } else {
                    
                    completionHandler(nil)
                }
            case .failure(let error):
                print("ERROR DETECTED: \(error)")
                completionHandler(nil)
            }
      
        }
    }
    func getTopRated(completionHandler : @escaping TopCompletionHandler){
        let parameters: Parameters = [
          
            "api_key": APIToken
        ]
        AF.request("https://api.themoviedb.org/3/trending/movie/day",parameters : parameters)
        .responseJSON{ dataResponse in
            switch dataResponse.result {
            case .success:
                if let data = dataResponse.data {
                    print("DATA FROM SERVER: \(data)")
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let filmJSON = try! jsonDecoder.decode(Source.self, from: data)
                    let topfilms = filmJSON.results
                    
                    completionHandler(topfilms)
                    print("RECUP DES DONNES AVEC SUCCES")
                    
                } else {
                    
                    completionHandler(nil)
                }
            case .failure(let error):
                print("ERROR DETECTED: \(error)")
                completionHandler(nil)
            }
      
        }
    }
    
    
}
