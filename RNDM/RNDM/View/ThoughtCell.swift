//
//  ThoughtCell.swift
//  RNDM
//
//  Created by omrobbie on 06/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ThoughtCell: UITableViewCell {

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var timestampLbl: UILabel!
    @IBOutlet weak var thoughtTxtLbl: UILabel!
    @IBOutlet weak var likesImg: UIImageView!
    @IBOutlet weak var likesNumLbl: UILabel!

    func configureCell(thought: Thought) {
        usernameLbl.text = thought.username
        timestampLbl.text = String(describing: thought.timestamp)
        thoughtTxtLbl.text = thought.thoughtTxt
        likesImg.image = #imageLiteral(resourceName: "starIconFilled")
        likesNumLbl.text = String(describing: thought.numLikes)
    }
}