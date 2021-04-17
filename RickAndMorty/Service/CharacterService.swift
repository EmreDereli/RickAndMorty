//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by TOS ANALYTICS on 17.04.2021.
//

import Foundation

class CharacterService {
    func fetchCharacters(url:URL,completion: @escaping ([Result]?) -> ()){
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let messages = try decoder.decode(CharacterModel.self, from: data)
                    completion(messages.results)
                    print(messages as Any)
                } catch DecodingError.dataCorrupted(let context) {
                    print(context)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                
                
            }
            
           
           
        }.resume()
        
    }
}
