//
//  alphabetCLVCell.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 09/12/2021.
//

import UIKit
import OSSSpeechKit
class alphabetCLVCell: UICollectionViewCell {
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var alphabetImage: UIImageView!
    @IBOutlet weak var alphabetLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func audioButton(_ sender: Any) {
        let speechKit = OSSSpeech.shared
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Hebrew)
        speechKit.speakText(alphabetLabel.text)
    }
    @IBAction func nextAlphabetButton(_ sender: Any) {
    }
    @IBAction func backAlphabetButton(_ sender: Any) {
        
    }
    
}
