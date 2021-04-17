//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by TOS ANALYTICS on 17.04.2021.
//

import Foundation

struct CharacterListViewModel {
    let characterList : [Result]
}

extension CharacterListViewModel {
    func numberOfRows()-> Int {
        return self.characterList.count
    }
    
    func characterAtIndex(_ index: Int) -> CharacterViewModel {
        let character = characterList[index]
        return CharacterViewModel(character: character)
    }
}


struct CharacterViewModel {
    let character : Result
    
    var id : Int{
        return self.character.id
    }
    
    var name : String{
        return self.character.name
    }
    
    var status : String{
        return self.character.status
    }
    
    var species : String{
        return self.character.species
    }
    var type : String{
        return self.character.type
    }
    var gender : String{
        return self.character.gender
    }
    var origin : Any{
        return self.character.origin
    }
    var location : Any{
        return self.character.location
    }
    var image : String{
        return self.character.image
    }
    var episode : [String]{
        return self.character.episode
    }
}
