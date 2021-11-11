//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class SelectLanguageVC: UIViewController {

    var listLanguage: [LangMenuModel] = [LangMenuModel]()
    @IBOutlet weak var selectLanguageCLV: UICollectionView!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButton(_ sender: Any) {
    }
    @IBOutlet weak var saveButtonView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectLanguageCLV.backgroundColor = UIColor.clear
        selectLanguageCLV.register(UINib(nibName: langCLVCell.className, bundle: nil), forCellWithReuseIdentifier: langCLVCell.className)
        saveButtonView.layer.cornerRadius = 30
        saveButtonView.layer.masksToBounds = true
        listLanguage = LangMenuData.shared.menu
        
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: langCLVCell.className, for: indexPath) as! langCLVCell
        cell.subView.layer.cornerRadius = 30
        cell.subView.layer.masksToBounds = true
        cell.countryFlagImage.layer.cornerRadius = cell.countryFlagImage.frame.size.width/2
        cell.countryFlagImage.clipsToBounds = true
        if indexPath.row == 0 {
            cell.titleLabel.text = "01  I want to learn"
            cell.countryFlagImage.image = self.listLanguage[21].image
            cell.langCodeLabel.text = self.listLanguage[21].textCode
            cell.langNameLabel.text = self.listLanguage[21].textName
            cell.downImage.isHidden = true

        } else if indexPath.row == 1 {
            cell.titleLabel.text = "02  I speak"
            cell.langCodeLabel.text = self.listLanguage[14].textCode
            cell.langNameLabel.text = self.listLanguage[14].textName
            cell.countryFlagImage.image = self.listLanguage[14].image
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 220)
        }
        return CGSize(width: (UIScreen.main.bounds.width) - 10, height: 150)
    }
}
