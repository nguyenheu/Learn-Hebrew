//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit
import OSSSpeechKit
class AlphabetDetailVC: UIViewController {
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var alphabetLabel: UILabel!
    @IBOutlet weak var alphabetImage: UIImageView!
    @IBOutlet weak var alphabetView: UIView!
    
    var listDataLanguageHE:[AlphabetModel] = [AlphabetModel]()
    var listDataAlphabet:[AlphabetModel] = [AlphabetModel]()
    var numberAlphabet = 0
    @IBAction func audioButton(_ sender: Any) {
        let speechKit = OSSSpeech.shared
        speechKit.voice = OSSVoice(quality: .enhanced, language: .Hebrew)
        let alphabetHE = listDataLanguageHE[numberAlphabet].phonetics.components(separatedBy: "-")
        speechKit.speakText(alphabetHE[1])
        
    }
    @IBAction func nextAlphabetButton(_ sender: Any) {
        if numberAlphabet == listDataLanguageHE.count - 1 {
            numberAlphabet = 0
            alphabetImage.image = UIImage(named: String(numberAlphabet+1) + "a")
        } else {
            numberAlphabet += 1
        }
        alphabetImage.image = UIImage(named: String(numberAlphabet+1) + "a")
        alphabetLabel.text = listDataLanguageHE[numberAlphabet].phonetics
    }
    @IBAction func backAlphabetButton(_ sender: Any) {
        if numberAlphabet == 0 {
            numberAlphabet = listDataLanguageHE.count - 1
            alphabetImage.image = UIImage(named: String(numberAlphabet+1) + "a")
        } else {
            numberAlphabet -= 1
        }
        
        alphabetLabel.text = listDataLanguageHE[numberAlphabet].phonetics
        alphabetImage.image = UIImage(named: String(numberAlphabet+1) + "a")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        alphabetView.layer.cornerRadius = 30
        alphabetView.layer.masksToBounds = true
        alphabetLabel.text = listDataLanguageHE[numberAlphabet].phonetics
        alphabetImage.image = UIImage(named: String(numberAlphabet+1) + "a")
    }
}
