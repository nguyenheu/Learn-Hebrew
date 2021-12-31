//
//  vocabCLVCell.swift
//  learn_hebrew
//
//  Created by Nguyễn Quốc Hiếu on 29/12/2021.
//

import UIKit
import OSSSpeechKit
class vocabCLVCell: UICollectionViewCell {

    @IBOutlet weak var vocabSubView: UIView!
    @IBOutlet weak var heLanguageLabel: UILabel!
    @IBOutlet weak var translateLanguageLabel: UILabel!
    @IBOutlet weak var otherLanguageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func onClickAudio(_ sender: Any) {
        let speechKit = OSSSpeech.shared
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Hebrew)
//        let audioHE2 = heLanguageLabel.text?.components(separatedBy: " ")
        speechKit.speakText(heLanguageLabel.text ?? "can not speak")
    }
    
}
