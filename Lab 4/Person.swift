//
//  Person.swift
//  Lab 4
//
//  Created by SHREDDING on 02.07.2023.
//

import Foundation
import UIKit

class Person{
    enum Status:String {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "Unknown"
    }
    
    enum Gender:String {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "Unknown"
    }
    
    let id: Int
    let name: String
    var status: Status
    var species: String
    let type: String
    var gender: Gender
    var location: String
    let image: UIImage
    let episode: [String]
    let url: String
    let created: String
    
    init(id: Int, name: String, status: String, species: String, type: String, gender: String?, location: String, image: UIImage, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = Status(rawValue: status) ?? Status.unknown
        self.species = species
        self.type = type
        self.gender = Gender(rawValue: gender ?? "") ?? Gender.unknown
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}
