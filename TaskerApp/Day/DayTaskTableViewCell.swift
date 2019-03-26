//
//  DayTaskTableViewCell.swift
//  TaskerApp
//
//  Created by user149270 on 3/4/19.
//

import UIKit

class DayTaskTableViewCell: UITableViewCell {
    // MARK: Outlets
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
