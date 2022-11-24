//
//  CharactersTableViewCell.swift
//  BreakingBad
//
//  Created by Hakan Adanur on 23.11.2022.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {
    @IBOutlet weak var charactersView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        charactersView.layer.cornerRadius = 8
//        charactersView.bord
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
