//
//  CharactersVC.swift
//  BreakingBad
//
//  Created by Hakan Adanur on 23.11.2022.
//

import UIKit
import SDWebImage

class CharactersVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel = CharactersViewModel()
    var size = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        size = Int(view.bounds.width / 3.0)
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.delegate = self
        viewModel.fetchCharacters()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterDetailsVC" {
            let destinationVC = segue.destination as! CharacterDetailsVC
            destinationVC.viewModel.selectedCharacter = viewModel.choosenCharacter
        }
    }
}

extension CharactersVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharactersCollectionViewCell", for: indexPath) as! CharactersCollectionViewCell
        let data = viewModel.characters[indexPath.row]
        if data.img != nil {
            cell.characterImageView.sd_setImage(with: URL(string: data.img!))
        } else {
            cell.characterImageView.image = UIImage(named: "noImage")
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: size , height: size )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.choosenCharacter = viewModel.characters[indexPath.row]
        performSegue(withIdentifier: "toCharacterDetailsVC", sender: nil)
    }
}

extension CharactersVC: CharactersVMDelegate {
    
    func fetchCharactersOnSuccess() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func fetchCharactersOnUnSuccess() {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: "No internet")
        }
    }
}
