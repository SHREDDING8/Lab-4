//
//  MainTableViewController.swift
//  Lab 4
//
//  Created by SHREDDING on 02.07.2023.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let networkManager = NetworkManager()
    
    var persons:[Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
                
        networkManager.getAllCharacters { response, isGetted  in
            
            let dispatchGroup0 = DispatchGroup()
            dispatchGroup0.enter()
            for person in (response ?? []){

                    self.networkManager.loadImg(url: person.image) { imageFromApi in
                        var image:UIImage = UIImage(named: "No Photo")!
                        if let img = imageFromApi{
                            image = img
                            print("img: \(person.id)")
                            
                        }
                        print(person.id)
                        let newPerson = Person(id: person.id, name: person.name, status: person.status.rawValue, species: person.species, type: person.type, gender: person.gender, location: person.location.name, image: image, episode: person.episode, url: person.url, created: person.created)
                        self.persons.append(newPerson)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
            }
        }
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
        
        name.text = persons[indexPath.row].name
        gender.text = persons[indexPath.row].gender.rawValue
        species.text = persons[indexPath.row].species
        image.image = persons[indexPath.row].image

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
}
