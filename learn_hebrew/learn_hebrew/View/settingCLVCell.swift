//
//  settingCLVCell.swift
//  learn_hebrew
//
//  Created by Nguyễn Quốc Hiếu on 17/12/2021.
//

import UIKit

class settingCLVCell: UICollectionViewCell {

    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingImage: UIImageView!
    @IBOutlet weak var firstExpandLabel: UILabel!
    @IBOutlet weak var secondExpandLabel: UILabel!
    @IBOutlet weak var thirdExpandLabel: UILabel!
    @IBOutlet weak var firstProgress: UIProgressView!
    @IBOutlet weak var secondProgress: UIProgressView!
    @IBOutlet weak var thirdProgress: UIProgressView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
