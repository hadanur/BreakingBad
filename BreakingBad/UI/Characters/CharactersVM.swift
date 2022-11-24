//
//  CharactersVM.swift
//  BreakingBad
//
//  Created by Hakan Adanur on 23.11.2022.
//

import Foundation

protocol CharactersVMDelegate {
    func fetchCharactersOnSuccess()
    func fetchCharactersOnUnSuccess()
}

class CharactersViewModel {
    let service = Webservice()
    var characters = [Character]()
    var delegate: CharactersVMDelegate?
    var choosenCharacter: Character!
    
    func fetchCharacters() {
        service.downloadCharacters { result in
            if let result = result {
                for character in result {
                    self.characters.append(character)
                }
                    self.delegate?.fetchCharactersOnSuccess()
                } else {
                    self.delegate?.fetchCharactersOnUnSuccess()
                }
            }
        }
    }

