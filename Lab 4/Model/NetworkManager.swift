//
//  NetworkManager.swift
//  Lab 4
//
//  Created by SHREDDING on 08.07.2023.
//

import Foundation
import UIKit

class NetworkManager{
    
    private let getAllCharactersUrlString = "https://rickandmortyapi.com/api/character"
    
    
    public func getAllCharacters(completion: @escaping ([Result]?,Bool)->Void){
        
        let url = URL(string: getAllCharactersUrlString)!
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil{
                completion(nil, false)
                return
            }
            
            do{
                let responseDecoded = try JSONDecoder().decode(CharactersJsonResponse.self, from: data!)
                
                
                var res:[Person] = []
                
                
                
                for person in (responseDecoded.results){
                    var image:UIImage = UIImage(named: "No Photo")!
                    
                    let dispatchGroup = DispatchGroup()
                    
                    dispatchGroup.enter()
                    DispatchQueue.main.async {
                        self.loadImg(url: person.image) { imageFromApi in
                            if let img = imageFromApi{
                                image = img
                                
                            }
                            dispatchGroup.leave()
                        }
                        dispatchGroup.notify(queue: .main) {
//                            print(person.id)
                            let newPerson = Person(id: person.id, name: person.name, status: person.status.rawValue, species: person.species, type: person.type, gender: person.gender, location: person.location.name, image: image, episode: person.episode, url: person.url, created: person.created)
                            res.append(newPerson)
                        }
                    }
                }
//                print("res count \(res.count)")
                
                
                
                
                
                
                completion(responseDecoded.results,true)
                return
                
            } catch let error{
                print("ERROR: \(error)")
                completion(nil,false)
            }
            

           
        }.resume()
    }
    
    public func loadImg(url:String, completion: @escaping (UIImage?)->Void){
        let url = URL(string: url)
        if let url{
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                completion(UIImage(data: data ?? Data()))
            }.resume()
        }
        
        
    }
    
    
    
}
