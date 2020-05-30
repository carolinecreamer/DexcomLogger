//
//  TableViewCell.swift
//  Carbie
//
//  Created by Caroline Creamer on 5/21/20.
//  Copyright © 2020 Caroline Creamer. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    let mealsArr = ["pizza", "pasta", "popcorn", "tortilla chips", "tacos", "yogurt", "strawberries", "blueberries"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
