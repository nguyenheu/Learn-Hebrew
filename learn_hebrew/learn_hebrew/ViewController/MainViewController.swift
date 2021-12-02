//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainCLV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCLV.backgroundColor = UIColor.clear
        mainCLV.register(UINib(nibName: mainCLVCell.className, bundle: nil), forCellWithReuseIdentifier: mainCLVCell.className)
        
        var cellWidth = 0
        if UIDevice.current.userInterfaceIdiom == .pad {
            cellWidth = Int(UIScreen.main.bounds.width) / 5 - 10
        } else {
            cellWidth = Int(UIScreen.main.bounds.width) / 3 - 10
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cellWidth, height: (cellWidth * 120) / 90)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        flowLayout.minimumInteritemSpacing = 0.0
        mainCLV.collectionViewLayout = flowLayout
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCLVCell.className, for: indexPath) as! mainCLVCell
        cell.myView.layer.cornerRadius = 16
        cell.myView.layer.masksToBounds = true
        
//        cell.myView.layer.borderWidth = 1.0
//        cell.myView.layer.borderColor = UIColor.black.cgColor
        
        cell.myView.layer.shadowColor = UIColor.black.cgColor
        cell.myView.layer.shadowOffset = CGSize(width: 10, height: 3)
        cell.myView.layer.shadowOpacity = 0.7
        cell.myView.layer.shadowRadius = 4.0
        
        if indexPath.row == 0 {
            cell.myImage.image = UIImage(named: "remove_ads.png")
            cell.myLabel.text = "Remove ads"
        } else if indexPath.row == 1 {
            cell.myImage.image = UIImage(named: "select_language.png")
            cell.myLabel.text = "Select language"
        } else if indexPath.row == 2 {
            cell.myImage.image = UIImage(named: "phrase_book.png")
            cell.myLabel.text = "Phrase book"
        } else if indexPath.row == 3 {
            cell.myImage.image = UIImage(named: "download_audio.png")
            cell.myLabel.text = "Download audio"
        } else if indexPath.row == 4 {
            cell.myImage.image = UIImage(named: "alphabet.png")
            cell.myLabel.text = "Alphabet"
        } else if indexPath.row == 5 {
            cell.myImage.image = UIImage(named: "number_1_to_100.png")
            cell.myLabel.text = "Numbers 1 to 100"
        } else if indexPath.row == 6 {
            cell.myImage.image = UIImage(named: "vocabulary.png")
            cell.myLabel.text = "Vocabulary"
        } else if indexPath.row == 7 {
            cell.myImage.image = UIImage(named: "vocab_game.png")
            cell.myLabel.text = "Vocab game"
        } else if indexPath.row == 8 {
            cell.myImage.image = UIImage(named: "cloze_test.png")
            cell.myLabel.text = "Cloze test"
        } else if indexPath.row == 9 {
            cell.myImage.image = UIImage(named: "crossword_puzzle.png")
            cell.myLabel.text = "Crossword puzzles"
        } else if indexPath.row == 10 {
            cell.myImage.image = UIImage(named: "find_the_opposite.png")
            cell.myLabel.text = "Find the opposites"
        } else if indexPath.row == 11 {
            cell.myImage.image = UIImage(named: "lang-geo_quiz.png")
            cell.myLabel.text = "Lang, Geo quiz"
        } else if indexPath.row == 12 {
            cell.myImage.image = UIImage(named: "translate.png")
            cell.myLabel.text = "Translate"
        } else if indexPath.row == 13 {
            cell.myImage.image = UIImage(named: "study_plan.png")
            cell.myLabel.text = "Study plan"
        } else if indexPath.row == 14 {
            cell.myImage.image = UIImage(named: "your_score.png")
            cell.myLabel.text = "Your score"
        } else if indexPath.row == 15 {
            cell.myImage.image = UIImage(named: "emergency.png")
            cell.myLabel.text = "Emergency"
        } else if indexPath.row == 16 {
            cell.myImage.image = UIImage(named: "radio_station.png")
            cell.myLabel.text = "Radio station"
        } else if indexPath.row == 17 {
            cell.myImage.image = UIImage(named: "other.png")
            cell.myLabel.text = "Other"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SelectLanguageVC") as! SelectLanguageVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated:true)
        } else if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PhraseBookVC") as! PhraseBookVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated:true)
        } else if indexPath.row == 3 {
            
        } else if indexPath.row == 4 {
            
        } else if indexPath.row == 5 {
            
        }  else if indexPath.row == 6 {
            
        } else if indexPath.row == 7 {
            
        } else if indexPath.row == 8 {
            
        } else if indexPath.row == 9 {
            
        } else if indexPath.row == 11 {
            
        } else if indexPath.row == 12 {
            
        } else if indexPath.row == 13 {
            
        } else if indexPath.row == 14 {
            
        } else if indexPath.row == 15 {
            
        } else if indexPath.row == 16 {
            
        } else if indexPath.row == 17 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated:true)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: 220)
        }
        return CGSize(width: (UIScreen.main.bounds.width - 50) / 2 - 10, height: 150)
    }
}
