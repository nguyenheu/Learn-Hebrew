//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit
import OSSSpeechKit
class testVC: UIViewController {

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
        speechKit.speakText(alphabetLabel.text)
        
    }
    @IBAction func nextAlphabetButton(_ sender: Any) {
        if numberAlphabet == listDataAlphabet.count - 1 {
            numberAlphabet = 0
        } else {
            numberAlphabet += 1
            alphabetLabel.text = listDataLanguageHE[numberAlphabet].phonetics
            
        }
    }
    @IBAction func backAlphabetButton(_ sender: Any) {
        if numberAlphabet == 0 {
            numberAlphabet = listDataLanguageHE.count - 1
        } else {
            numberAlphabet -= 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        AlphabetService.shared.getDataAlphabet(){ listDataAlphabet, error in
            if let listDataAlphabet = listDataAlphabet{
                self.listDataAlphabet = listDataAlphabet
                self.getListDataLanguageHE()
            }
        }
        if numberAlphabet < 10 {
            alphabetImage.image = UIImage(named: String(0) + String(numberAlphabet+1) + "a")
            if numberAlphabet == 9 {
                alphabetImage.image = UIImage(named: "10a")
            }
        } else if numberAlphabet >= 10 {
            alphabetImage.image = UIImage(named: String(numberAlphabet+1) + "a")
        }
        alphabetLabel.text = listDataLanguageHE[numberAlphabet].phonetics
       
            
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    func getListDataLanguageHE() {
        for item in 1..<listDataAlphabet.count {
            if listDataAlphabet[item].languageCode == "HE"
            {
                listDataLanguageHE.append(listDataAlphabet[item])
            }
        }
    }
}

