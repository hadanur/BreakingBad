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
                self.characters = result
                    self.delegate?.fetchCharactersOnSuccess()
                } else {
                    self.delegate?.fetchCharactersOnUnSuccess()
                }
            }
        }
    }

