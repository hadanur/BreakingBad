//
//  Webservice.swift
//  BreakingBad
//
//  Created by Hakan Adanur on 23.11.2022.
//

import Foundation

class Webservice {
    
    func downloadCharacters(completion : @escaping ([Character]?) -> ()) {
        
        let url = URL(string: "https://www.breakingbadapi.com/api/characters")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let characterList = try JSONDecoder().decode([Character].self, from: data)
                    print(characterList)
                    completion(characterList)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
}
