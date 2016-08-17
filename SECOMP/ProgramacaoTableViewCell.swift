//
//  ProgramacaoTableViewCell.swift
//  SECOMP
//
//  Created by FelipeSampaio on 8/15/16.
//  Copyright © 2016 secompufscar. All rights reserved.
//

import UIKit

class ProgramacaoTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var horarioLabel: UILabel!
    @IBOutlet weak var imagemMinistrante: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
