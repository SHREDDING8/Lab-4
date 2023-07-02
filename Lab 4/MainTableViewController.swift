//
//  MainTableViewController.swift
//  Lab 4
//
//  Created by SHREDDING on 02.07.2023.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var persons:[Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setPersons()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        let name = cell.viewWithTag(1) as! UILabel
        let image = cell.viewWithTag(2) as! UIImageView
        let gender = cell.viewWithTag(3) as! UILabel
        let species = cell.viewWithTag(4) as! UILabel
        
        name.text = persons[indexPath.row].fullName
        gender.text = persons[indexPath.row].gender.rawValue
        species.text = persons[indexPath.row].species
        image.image = UIImage(named: persons[indexPath.row].name)


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PersonViewController") as! PersonViewController
        
        vc.person = persons[indexPath.row]
        vc.completion = {
            person in
            self.persons[indexPath.row] = person
            tableView.reloadData()
        }
        
        self.present(vc, animated: true)
    }
    
    fileprivate func setPersons(){
        let rick = Person(id: 0, name: "Rick", lastName: "Sanchez", status: .alive, species: "Human" , gender: .male, location: "Home")
        
        let morty = Person(id: 1, name: "Morty", lastName: "Smith", status: .alive, species: "Human" , gender: .male, location: "Home")
        
        let summer = Person(id: 2, name: "Summer", lastName: "Smith", status: .alive, species: "Human" , gender: .female, location: "Home")
        
        let jerry = Person(id: 3, name: "Jerry", lastName: "Smith", status: .alive, species: "Unknown" , gender: .genderless, location: "Home")
        
        let beth = Person(id: 4, name: "Beth", lastName: "Smith", status: .alive, species: "Human" , gender: .female, location: "Home")
        
        
        self.persons.append(contentsOf: [rick,morty,summer,jerry,beth])
    }

}
