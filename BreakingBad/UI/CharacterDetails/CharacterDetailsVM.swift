//
//  CharacterDetailsVM.swift
//  BreakingBad
//
//  Created by Hakan Adanur on 23.11.2022.
//

import Foundation

protocol CharacterDetailsVMDelegate {
    func fetchCharacterDetailsOnSuccess()
    func fetchCharacterDetailsOnUnSuccess()
}

class CharacterDetailsViewModel {
    let service = Webservice()
//    var characters = [Character]()
    var delegate: CharacterDetailsVMDelegate?
    var selectedCharacter: Character!
    
//    func fetchCharacters() {
//        service.downloadCharacters { result in
//            if let result = result {
//                for character in result {
//                    self.characters.append(character)
//                }
//                    self.delegate?.fetchCharacterDetailsOnSuccess()
//                } else {
//                    self.delegate?.fetchCharacterDetailsOnUnSuccess()
//                }
//            }
//        }

}
