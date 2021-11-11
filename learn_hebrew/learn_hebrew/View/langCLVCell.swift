//
//  langCLVCell.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 08/11/2021.
//

import UIKit

class langCLVCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countryFlagImage: UIImageView!
    @IBOutlet weak var langCodeLabel: UILabel!
    
    @IBOutlet weak var langNameLabel: UILabel!
    @IBOutlet weak var downImage: UIImageView!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
