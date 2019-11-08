//
//  OpsiTableViewCell.swift
//  Pinterin
//
//  Created by andyptra on 11/16/17.
//  Copyright © 2017 andyptra. All rights reserved.
//

import UIKit

class OpsiTableViewCell: UITableViewCell {

  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  @IBOutlet weak var opsiLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
