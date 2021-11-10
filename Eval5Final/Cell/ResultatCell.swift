//
//  ResultatCell.swift
//  Eval5Final
//
//  Created by Student04 on 10/11/2021.
//

import UIKit

class ResultatCell: UITableViewCell {

    @IBOutlet weak var afficheFilm: UIImageView!
    @IBOutlet weak var titreFilm: UILabel!
    @IBOutlet weak var dateFilm: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
