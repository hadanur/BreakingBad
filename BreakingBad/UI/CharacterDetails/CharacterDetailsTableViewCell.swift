//
//  CharacterDetailsTableViewCell.swift
//  BreakingBad
//
//  Created by Hakan Adanur on 23.11.2022.
//

import UIKit

class CharacterDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var characterDetailsImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
