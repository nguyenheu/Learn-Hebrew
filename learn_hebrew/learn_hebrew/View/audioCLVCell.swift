//
//  audioCLVCell.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/12/2021.
//

import UIKit
import OSSSpeechKit
class audioCLVCell: UICollectionViewCell {

    
    @IBOutlet weak var heLanguageLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var translateLanguageLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var voiceButton: UIButton!
    var check = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func audioButton(_ sender: UIButton) {
        let speechKit = OSSSpeech.shared
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Hebrew)
        let audioHE = heLanguageLabel.text?.components(separatedBy: .letters)
        speechKit.speakText(audioHE![0])
    }
    @IBAction func audio2Button(_ sender: Any) {
        let speechKit = OSSSpeech.shared
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Hebrew)
//        let audioHE2 = heLanguageLabel.text?.components(separatedBy: " ")
        speechKit.speakText(heLanguageLabel.text ?? "nothing")
    }
}
