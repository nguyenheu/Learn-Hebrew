//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class StudyPlanVC: UIViewController {

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

extension StudyPlanVC: UICollectionViewDelegate, UICollectionViewDataSource {
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

extension StudyPlanVC: UICollectionViewDelegateFlowLayout {
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

