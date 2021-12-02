//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var settingCLV: UICollectionView!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCLV.backgroundColor = UIColor.clear
        settingCLV.register(UINib(nibName: langCLVCell2.className, bundle: nil), forCellWithReuseIdentifier: langCLVCell2.className)
        
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
        settingCLV.collectionViewLayout = flowLayout
    }
}

extension SettingVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: langCLVCell2.className, for: indexPath) as! langCLVCell2
        cell.myImage.image = UIImage(named: "down.png")
        cell.lineImage.image = UIImage(named: "line.png")
        cell.myLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        cell.myLabel.textColor = .black
        if indexPath.row == 0 {
            cell.myLabel.text = "01  Delete zip files"
        } else if indexPath.row == 1 {
            cell.myLabel.text = "02  Volumn setting"
        } else if indexPath.row == 2 {
            cell.myLabel.text = "03  Transliteration settings"
        } else if indexPath.row == 3 {
            cell.myLabel.text = "04  Text size settings"
        } else if indexPath.row == 4 {
            cell.myLabel.text = "05  Help"
        } else if indexPath.row == 5 {
            cell.myLabel.text = "06  Textbook"
        } else if indexPath.row == 6 {
            cell.myLabel.text = "07  Imprint"
        } else if indexPath.row == 7 {
            cell.myLabel.text = "08  Disclaimer"
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
            
        }        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension SettingVC: UICollectionViewDelegateFlowLayout {
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
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 60)
        }
        return CGSize(width: UIScreen.main.bounds.width - 10, height: 40)
    }
}
