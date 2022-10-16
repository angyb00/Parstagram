//
//  CommentCell.swift
//  Parstagram
//
//  Created by Angarag Gansukh on 10/15/22.
//

import UIKit

class CommentCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
