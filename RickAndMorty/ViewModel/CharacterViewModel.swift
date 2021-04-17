//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by TOS ANALYTICS on 17.04.2021.
//

import Foundation

struct CharacterListViewModel {
    let characterList : [CharacterModel]
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
    let character : CharacterModel
    
    var name : String{
        return self.character.name
    }
    
    var status : String{
        return self.character.status
    }
    
    var species : String{
        return self.character.species
    }
    
    var image : String{
        return self.character.image
    }
}
