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
    var delegate: CharacterDetailsVMDelegate?
    var selectedCharacter: Character!
}
