//
//  CustomCell.swift
//  MovieDataBase MdevData
//
//  Created by NewGroup4 on 2023-11-23.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var contenView: UIView!
    @IBOutlet weak var backgroundStack: UIStackView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var studioName: UILabel!
    @IBOutlet weak var criticsRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundStack.layer.cornerRadius = 20
        movieImage.layer.cornerRadius = 20
        
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
