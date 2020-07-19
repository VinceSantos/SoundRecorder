//
//  UserPostTableViewCell.swift
//  Wubba Lubba Dub Dub
//
//  Created by Vince Carlo Santos on 15/05/2020.
//  Copyright © 2020 Vince Carlo Santos. All rights reserved.
//

import UIKit

class UserPostTableViewCell: UITableViewCell {
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var overdubBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
