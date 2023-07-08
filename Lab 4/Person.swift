//
//  Person.swift
//  Lab 4
//
//  Created by SHREDDING on 02.07.2023.
//

import Foundation

class Person{
    enum Status {
        case alive
        case dead
        case unknown
    }
    
    enum Gender:String {
        case female = "female"
        case male = "male"
        case genderless = "genderless"
        case unknown = "unknown"
    }
    
    let id: Int
    let name: String
    
    let lastName:String
    var fullName:String{
        return name + " " + lastName
    }
    var status: Status
    var species: String
    var gender: Gender
    var location: String
    
    
    init(id: Int, name: String, lastName: String, status: Status, species: String, gender: Gender, location: String) {
        self.id = id
        self.name = name
        self.lastName = lastName
        self.status = status
        self.species = species
        self.gender = gender
        self.location = location
    }
}
