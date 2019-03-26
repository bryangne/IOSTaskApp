//
//  LaterTableViewCell.swift
//  TaskerApp
//
//  Created by Mac Pro 2 on 2019-03-26.
//

import UIKit

class LaterTableViewCell: UITableViewCell {
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
