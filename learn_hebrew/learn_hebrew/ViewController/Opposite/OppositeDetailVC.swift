
//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class OppositeDetailVC: UIViewController {

    @IBOutlet weak var oppositeCLV: UICollectionView!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        oppositeCLV.backgroundColor = UIColor.clear
        oppositeCLV.register(UINib(nibName: oppositeCLVCell.className, bundle: nil), forCellWithReuseIdentifier: oppositeCLVCell.className)
        
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
        oppositeCLV.collectionViewLayout = flowLayout
    }
}

extension OppositeDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: oppositeCLVCell.className, for: indexPath) as! oppositeCLVCell
        cell.myView.layer.cornerRadius = 30
        cell.myView.layer.masksToBounds = true
        
        cell.myImage.image = UIImage(named: "bright_purple")
        if indexPath.row == 0 {
            cell.myLabel.text = "Nouns"
        } else if indexPath.row == 1 {
            cell.myLabel.text = "Verbs"
        } else if indexPath.row == 2 {
            cell.myLabel.text = "Adjectives"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OppositeVC") as! OppositeVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension OppositeDetailVC: UICollectionViewDelegateFlowLayout {
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
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 60)
        }
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 60)
    }
}

