//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class SettingVC: UIViewController {
    var indexSelected = -1
    @IBOutlet weak var settingCLV: UICollectionView!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCLV.backgroundColor = UIColor.clear
        settingCLV.register(UINib(nibName: settingCLVCell.className, bundle: nil), forCellWithReuseIdentifier: settingCLVCell.className)
        
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: settingCLVCell.className, for: indexPath) as! settingCLVCell
        cell.settingImage.image = UIImage(named: "down.png")

        if indexPath.row == 0 {
            cell.settingLabel.text = "01  Delete zip files"
        } else if indexPath.row == 1 {
            cell.settingLabel.text = "02  Volumn setting"
            cell.firstExpandLabel.text = "Volumn level"
        }
//        else if indexPath.row == 2 {
//            cell.settingLabel.text = "03  Text size settings"
//            cell.firstExpandLabel.text = "Native language font size"
//            cell.secondExpandLabel.text = "Target language font size"
//            cell.thirdExpandLabel.text = "Menu font size"
//        }
        else if indexPath.row == 2 {
            cell.settingLabel.text = "03  Help"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        if indexPath.row == 0 {
            
        } else if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated:true)
        }
        settingCLV.reloadData()
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
        if indexPath.row == indexSelected {
            if indexPath.row == 1 {
                if UIDevice.current.userInterfaceIdiom == .pad{
                    return CGSize(width: UIScreen.main.bounds.width - 40, height: 110)
                }
                return CGSize(width: (UIScreen.main.bounds.width) - 40, height: 110)
            }
//            else if indexPath.row == 2 {
//                if UIDevice.current.userInterfaceIdiom == .pad{
//                    return CGSize(width: UIScreen.main.bounds.width - 40, height: 200)
//                }
//                return CGSize(width: (UIScreen.main.bounds.width) - 40, height: 200)
//            }
            
        }
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: UIScreen.main.bounds.width - 40, height: 40)
        }
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 40)
    }
}
