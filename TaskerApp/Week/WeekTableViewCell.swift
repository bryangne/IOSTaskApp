//
//  WeekTableViewCell.swift
//  TaskerApp
//
//  Created by Mac Pro 3 on 2019-03-25.
//

import UIKit

class WeekTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
