//
//  CharacterDetailsVC.swift
//  BreakingBad
//
//  Created by Hakan Adanur on 23.11.2022.
//

import UIKit
import SDWebImage

class CharacterDetailsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = CharacterDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.title = viewModel.selectedCharacter.nickname
    }

}

extension CharacterDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDetailsTableViewCell") as! CharacterDetailsTableViewCell
        let data = viewModel.selectedCharacter
        cell.nicknameLabel.text = viewModel.selectedCharacter.nickname
        cell.nameLabel.text = data?.name
        cell.statusLabel.text = data?.status
        cell.characterDetailsImageView.sd_setImage(with: URL(string: data!.img))
        return cell
    }
}
