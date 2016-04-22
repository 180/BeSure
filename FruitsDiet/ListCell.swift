//
//  ListCell.swift
//  FruitsDiet
//
//  Created by Maciej Stanik on 22/04/16.
//  Copyright © 2016 Maciej Stanik. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
