//
//  PersonViewController.swift
//  Lab 4
//
//  Created by SHREDDING on 02.07.2023.
//

import UIKit

class PersonViewController: UIViewController {
    
    var person:Person!
    
    var completion: ((Person)->Void)?
    
    
    
    @IBOutlet weak var species: UITextField!
    
    
    @IBOutlet weak var location: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    
    @IBOutlet weak var status: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.species.text = person.species
        self.location.text = person.location
        
        switch person.gender{
            
        case .female:
            gender.selectedSegmentIndex = 0
        case .male:
            gender.selectedSegmentIndex = 1
        case .genderless:
            gender.selectedSegmentIndex = 2
        case .unknown:
            gender.selectedSegmentIndex = 3
        }
        switch person.status{
            
        case .alive:
            status.selectedSegmentIndex = 0
        case .dead:
            status.selectedSegmentIndex = 1
        case .unknown:
            status.selectedSegmentIndex = 2
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        completion?(person)
    }
    
    
    @IBAction func genderChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            person.gender = .female
        case 1:
            person.gender = .male
        case 2:
            person.gender = .genderless
        case 3:
            person.gender = .unknown
        default:
            break
            
        }
    }
    
    
    @IBAction func statusChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            person.status = .alive
        case 1:
            person.status = .dead
        case 2:
            person.status = .unknown
        default:
            break
            
        }
    }
}

extension PersonViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField == species{
            person.species = textField.text ?? ""
        }else if textField == location{
            person.location = textField.text ?? ""
        }
        
        return true
    }
}
