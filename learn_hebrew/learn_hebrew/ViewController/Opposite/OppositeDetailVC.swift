
//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class OppositeDetailVC: UIViewController {
    var listDataOpposite:[OppositeModel] = [OppositeModel]()
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var matchWordCLV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        matchWordCLV.backgroundColor = UIColor.clear
        matchWordCLV.register(UINib(nibName: typeWordCLVCell.className, bundle: nil), forCellWithReuseIdentifier: typeWordCLVCell.className)

        OppositeService.shared.getDataOpposite(){ listDataOpposite, error in
            if let listDataOpposite = listDataOpposite{
                self.listDataOpposite = listDataOpposite
            }
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
        matchWordCLV.collectionViewLayout = flowLayout
        
    }
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!) {
           if gesture.state != .ended {
               return
           }
        let p = gesture.location(in: self.matchWordCLV)

        if let indexPath = self.matchWordCLV.indexPathForItem(at: p) {
            // get the cell at indexPath (the one you long pressed)
            _ = self.matchWordCLV.cellForItem(at: indexPath)
            // do stuff with the cell
        } else {
            print("couldn't find index path")
        }
    }
    
}
let a = OppositeDetailVC()
let lpgr = UILongPressGestureRecognizer(target: a, action: #selector(OppositeDetailVC.handleLongPress))

extension OppositeDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: typeWordCLVCell.className, for: indexPath) as! typeWordCLVCell
        cell.viewRight1.layer.cornerRadius = 10
        cell.viewRight2.layer.cornerRadius = 10
        cell.viewRight3.layer.cornerRadius = 10
        cell.viewRight4.layer.cornerRadius = 10
        cell.viewMid1.layer.cornerRadius = 10
        cell.viewMid2.layer.cornerRadius = 10
        cell.viewMid3.layer.cornerRadius = 10
        cell.viewMid4.layer.cornerRadius = 10
        cell.viewLeft1.layer.cornerRadius = 10
        cell.viewLeft2.layer.cornerRadius = 10
        cell.viewLeft3.layer.cornerRadius = 10
        cell.viewLeft4.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: typeWordCLVCell.className, for: indexPath) as! typeWordCLVCell
        UIView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: 7), animations: {
            cell.viewRight1.frame.origin.y+=200

        },completion: nil)
        
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
            return CGSize(width: UIScreen.main.bounds.width - 40, height: 420)
        }
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 420)
    }
}
