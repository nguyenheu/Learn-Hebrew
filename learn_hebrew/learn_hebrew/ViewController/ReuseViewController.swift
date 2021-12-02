//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class ReuseViewController: UIViewController {

    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var reuseCLV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        reuseCLV.backgroundColor = UIColor.clear
        reuseCLV.register(UINib(nibName: reuseCLVCell.className, bundle: nil), forCellWithReuseIdentifier: reuseCLVCell.className)
        
        
        
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
        reuseCLV.collectionViewLayout = flowLayout
    }
}

extension ReuseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCLVCell.className, for: indexPath) as! reuseCLVCell
        cell.starImage.image = UIImage(named: "star_empty")
        cell.reuseView.layer.cornerRadius = 24
        cell.reuseView.layer.masksToBounds = true
        
        if indexPath.row == 0 {
            cell.listLabel.text = "Word list"
            cell.categoryImage.image = UIImage(named: "package")
        } else if indexPath.row == 1 {
            cell.listLabel.text = "Flash card"
            cell.categoryImage.image = UIImage(named: "card_black")
        } else if indexPath.row == 2 {
            cell.listLabel.text = "Take test"
            cell.categoryImage.image = UIImage(named: "note_black")
        } else if indexPath.row == 3 {
            cell.listLabel.text = "Did you know?"
            cell.categoryImage.image = UIImage(named: "list_black")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else if indexPath.row == 1 {
            
        } else if indexPath.row == 2 {
            
        } else if indexPath.row == 3 {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension ReuseViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: UIScreen.main.bounds.width - 40, height: 48)
        }
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 48)
    }
}
