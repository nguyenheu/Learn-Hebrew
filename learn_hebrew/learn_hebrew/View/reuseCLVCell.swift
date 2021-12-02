//
//  reuseCLVCell.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 29/11/2021.
//

import UIKit

class reuseCLVCell: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var reuseView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
