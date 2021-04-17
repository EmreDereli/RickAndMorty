//
//  ViewController.swift
//  RickAndMorty
//
//  Created by TOS ANALYTICS on 17.04.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var characterViewModel : CharacterListViewModel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterViewModel != nil ? characterViewModel.numberOfRows() : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableViewCell
        
        let character = characterViewModel.characterAtIndex(indexPath.row)
        let url = URL(string: character.image)!
        let data = try? Data(contentsOf: url)
        var image : UIImage?
        if let imageData = data {
             image = UIImage(data: imageData)
        }
        cell.characterImageView.image = image
        cell.nameLabel.text = "Name : \(character.name)"
        cell.statusLabel.text = "Status : \(character.status)"
        cell.speciesLabel.text = "Species : \(character.species)"
        return cell
        
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
       
    }
    
    func getData(){
        let url =  URL(string: "https://rickandmortyapi.com/api/character")!
        
        CharacterService().fetchCharacters(url: url) { (characterList) in
         
            if let characterList = characterList{
                self.characterViewModel = CharacterListViewModel(characterList: characterList)
                print("Success")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

