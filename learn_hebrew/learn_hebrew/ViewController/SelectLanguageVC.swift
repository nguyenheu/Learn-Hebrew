//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class SelectLanguageVC: UIViewController {

    var listLanguage: [LangMenuModel] = [LangMenuModel]()
    var indexSelected = -1
    var index = 14
    @IBOutlet weak var selectLanguageCLV: UICollectionView!
    @IBOutlet weak var selectedLanguageCLV: UICollectionView!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
    let userDefaults = UserDefaults.standard
    let SAVE_KEY = "saveKey"
    @IBAction func saveButton(_ sender: Any) {
        userDefaults.set(index, forKey: SAVE_KEY)
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var saveButtonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectLanguageCLV.isScrollEnabled = false
        
        selectLanguageCLV.backgroundColor = UIColor.clear
        selectLanguageCLV.register(UINib(nibName: langCLVCell.className, bundle: nil), forCellWithReuseIdentifier: langCLVCell.className)
        
        selectLanguageCLV.register(UINib(nibName: langCLVCell2.className, bundle: nil), forCellWithReuseIdentifier: langCLVCell2.className)
        
        selectedLanguageCLV.backgroundColor = UIColor.clear
        selectedLanguageCLV.register(UINib(nibName: langCLVCell.className, bundle: nil), forCellWithReuseIdentifier: langCLVCell.className)
        
        saveButtonView.layer.cornerRadius = 25
        saveButtonView.layer.masksToBounds = true
        
        selectedLanguageCLV.isHidden = true
        listLanguage = LangMenuData.shared.menu
        
        if let saveSuccessful = userDefaults.integer(forKey: SAVE_KEY) as? Int{
            index = saveSuccessful
        }
        
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
        selectLanguageCLV.collectionViewLayout = flowLayout
    }
}

extension SelectLanguageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == selectLanguageCLV {
            return 4
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == selectLanguageCLV {
            return 1
        }
        return listLanguage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexSelected == 1{
            selectedLanguageCLV.isHidden = false
            saveButtonView.isHidden = true
            
        } else {
            selectedLanguageCLV.isHidden = true
            saveButtonView.isHidden = false
        }
        
        if collectionView == selectLanguageCLV {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: langCLVCell.className, for: indexPath) as! langCLVCell
            cell2.mainView.layer.cornerRadius = 30
            cell2.mainView.layer.masksToBounds = true
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: langCLVCell2.className, for: indexPath) as! langCLVCell2
        
            if indexPath.section == 0 {
                cell.myLabel.text = "01  I want to learn"
                return cell
            } else if indexPath.section == 1 {
                cell2.countryFlagImage.image = self.listLanguage[21].image
                cell2.langCodeLabel.text = self.listLanguage[21].textCode
                cell2.langNameLabel.text = self.listLanguage[21].textName
                cell2.downImage.isHidden = true
            } else if indexPath.section == 2 {
                cell.myLabel.text = "02  I speak"
                return cell
            } else if indexPath.section == 3 {
                cell2.langCodeLabel.text = self.listLanguage[index].textCode
                cell2.langNameLabel.text = self.listLanguage[index].textName
                cell2.countryFlagImage.image = self.listLanguage[index].image
            }
            return cell2
        }
        else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: langCLVCell.className, for: indexPath) as! langCLVCell
            cell2.mainView.layer.cornerRadius = 30
            cell2.mainView.layer.masksToBounds = true

            cell2.downImage.isHidden = true
            cell2.langCodeLabel.text = self.listLanguage[indexPath.row].textCode
            cell2.langNameLabel.text = self.listLanguage[indexPath.row].textName
            cell2.countryFlagImage.image = self.listLanguage[indexPath.row].image
            
            return cell2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == selectLanguageCLV {
            if indexPath.section == 3 {
                if indexSelected == 1 {
                    indexSelected = 0
                }
                else {
                    indexSelected = 1
                }
            }
        }
        else {
            index = indexPath.item
        }
        selectLanguageCLV.reloadData()
        selectedLanguageCLV.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension SelectLanguageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == selectLanguageCLV {
            return 30
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == indexSelected {
            if UIDevice.current.userInterfaceIdiom == .pad{
                return CGSize(width: UIScreen.main.bounds.width - 20, height: 60)
            }
            return CGSize(width: (UIScreen.main.bounds.width) - 10, height: 60)
        }
        if indexPath.section == 0 || indexPath.section == 2 {
            if UIDevice.current.userInterfaceIdiom == .pad{
                return CGSize(width: UIScreen.main.bounds.width - 20, height: 60)
            }
            return CGSize(width: (UIScreen.main.bounds.width) - 10, height: 60)
        } else {
            if UIDevice.current.userInterfaceIdiom == .pad{
                return CGSize(width: UIScreen.main.bounds.width - 20, height: 60)
            }
            return CGSize(width: (UIScreen.main.bounds.width) - 10, height: 60)
        }
    }
}
