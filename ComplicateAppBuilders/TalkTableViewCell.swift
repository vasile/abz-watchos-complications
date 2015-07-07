//
//  TalkTableViewCell.swift
//  ComplicateAppBuilders
//
//  Created by Vasile Cotovanu on 07/07/15.
//  Copyright © 2015 Vasile Cotovanu. All rights reserved.
//

import UIKit

class TalkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var TalkImage: UIImageView!
    @IBOutlet weak var TalkTitle: UILabel!
    @IBOutlet weak var TalkSubtitle: UILabel!
    @IBOutlet weak var TalkSpeaker: UILabel!
    @IBOutlet weak var TalkTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
