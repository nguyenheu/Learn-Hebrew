//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class AlphabetVC: UIViewController {

    @IBOutlet weak var alphabetCLV: UICollectionView!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    var listDataAlphabet:[AlphabetModel] = [AlphabetModel]()
    var listDataLanguageHE:[AlphabetModel] = [AlphabetModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        alphabetCLV.backgroundColor = UIColor.clear
        alphabetCLV.register(UINib(nibName: alphabetCLVCell.className, bundle: nil), forCellWithReuseIdentifier: alphabetCLVCell.className)
        
        AlphabetService.shared.getDataAlphabet(){ listDataAlphabet, error in
            if let listDataAlphabet = listDataAlphabet{
                self.listDataAlphabet = listDataAlphabet
                self.getListDataLanguageHE()
                self.alphabetCLV.reloadData()
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
        alphabetCLV.collectionViewLayout = flowLayout
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

extension AlphabetVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listDataLanguageHE.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: alphabetCLVCell.className, for: indexPath) as! alphabetCLVCell

        cell.alphabetImage.image = UIImage(named: String(indexPath.row+1) + "a")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AlphabetDetailVC") as! AlphabetDetailVC
        vc.listDataLanguageHE = listDataLanguageHE
        vc.listDataAlphabet = listDataAlphabet
        vc.numberAlphabet = indexPath.row
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension AlphabetVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: UIScreen.main.bounds.width / 3 - 50, height: 180)
        }
        return CGSize(width: UIScreen.main.bounds.width / 2 - 40, height: 160)
    }
}
