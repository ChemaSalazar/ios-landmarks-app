//
//  ModelData.swift
//  Landmarks
//
//  Created by Chema Salazar on 6/6/21.
//

import Foundation
import Combine


//Define location of bound data.
final class ModelData: ObservableObject {
    //this is the file subscriber's get new data changes from
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Could not find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
