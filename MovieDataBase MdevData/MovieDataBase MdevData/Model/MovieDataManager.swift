//
//  DataManager.swift
//  MovieDataBase MdevData
//
//  Created by NewGroup 4 on 2023-11-23.
//

import Foundation
import CoreData
import UIKit

class MovieDataManager {
    
    static let shared = MovieDataManager()
    var movies: [Movies] = []
    
    
    func saveMovies(_ movies: [MovieData]) {
        let context = AppDelegate.shared.persistentContainer.viewContext
        
        for movieData in movies {
            let entity = NSEntityDescription.entity(forEntityName: "Movies", in: context)!
            let movieFileObject = NSManagedObject(entity: entity, insertInto: context)
            
            let mirror = Mirror(reflecting: movieData)
            for movieJson in mirror.children {
                if let key = movieJson.label {
                    movieFileObject.setValue(movieJson.value, forKey: key)
                }
            }
        }
        AppDelegate.shared.saveContext()
    }
    
    
    func decodeJsonToEntity() {
        guard let urlPath = Bundle.main.url(forResource: "movieData", withExtension: "json"),
              let data = try? Data(contentsOf: urlPath) else {
            return
        }
        do {
            let movies = try JSONDecoder().decode([MovieData].self, from: data)
            saveMovies(movies)
        } catch {
            print(error)
        }
    }
    
    
    func fetchMoviesFromEntity() -> [Movies] {
        let context = AppDelegate.shared.persistentContainer.viewContext
        let request: NSFetchRequest<Movies> = Movies.fetchRequest()
        do {
            return try context.fetch(request)
            
        } catch {
            print("Error: \(error)")
            return []
        }
    }
}
