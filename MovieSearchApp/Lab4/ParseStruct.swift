//
//  Parse_struct.swift
//  Lab4
//
//  Created by Steven Wong on 25/10/2021.
//

import Foundation

struct APIResults:Codable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
}
struct Movie: Codable {
    let id: Int!
    let poster_path: String?
    let title: String
    let release_date: String?
    let vote_average: Double
    let overview: String
    let vote_count:Int!
}
struct SimpleStruct: Codable {
    let array: [Movie]
}

class utility{
    static func _add(_ movie: Movie){
        var objectsArray = [Movie]()
        let defaults = UserDefaults.standard
        if let SavedPlayers = defaults.object(forKey: "savedinfo") as? Data {
          let decoder = JSONDecoder()
          if let loadedPlayers = try? decoder.decode([Movie].self, from: SavedPlayers) {
               objectsArray = loadedPlayers
          }
        }
        var exists:Bool = false
        for i in objectsArray{
            if(i.id == movie.id){
                exists = true
            }
        }
        if(!exists){
            objectsArray.append(movie)
        }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(objectsArray) {
          defaults.set(encoded, forKey: "savedinfo")
        }
    }
}
