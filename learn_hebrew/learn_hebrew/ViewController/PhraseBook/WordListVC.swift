//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class WordListVC: UIViewController {
    var index = 14
    var indexHE = 21
    var indexSelected = -1
    var listLessonData:[LessonModel] = [LessonModel]()
    var listLessonFullData: [LessonDataModel] = [LessonDataModel]()
    var listData: [LessonDataModel] = [LessonDataModel]()
    var listDataHE: [LessonDataModel] = [LessonDataModel]()

    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    let userDefaults = UserDefaults.standard
    let SAVE_KEY = "saveKey"
    var lessonID = 0
    var lessonIDHebrew = 0
    @IBOutlet weak var wordListCLV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        wordListCLV.backgroundColor = UIColor.clear
        wordListCLV.register(UINib(nibName: audioCLVCell.className, bundle: nil), forCellWithReuseIdentifier: audioCLVCell.className)
        
        LessonDataService.shared.getDataLessonData(){ listLessonFullData, error in
            if let listLessonFullData = listLessonFullData{
                self.listLessonFullData = listLessonFullData
                self.getListData()
                self.getListDataHE()
                self.wordListCLV.reloadData()
            }
        }
        
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
        wordListCLV.collectionViewLayout = flowLayout
    }
    func getListData() {
        for item in listLessonFullData {
            if item.lessonId == lessonID
            {
                listData.append(item)
            }
        }
    }
    func getListDataHE() {
        for item in listLessonFullData {
            if item.lessonId == lessonIDHebrew
            {
                listDataHE.append(item)
            }
        }
    }
}

extension WordListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: audioCLVCell.className, for: indexPath) as! audioCLVCell
        cell.pauseButton.isHidden = true
        let fullNameArr:[String] = self.listData[indexPath.row].value.components(separatedBy: "@")

        cell.languageLabel.text = fullNameArr[0]

        let fullNameArr2:[String] = self.listDataHE[indexPath.row].value.components(separatedBy: "@")
        cell.heLanguageLabel.text = fullNameArr2[0]
        cell.translateLanguageLabel.text = fullNameArr2[1]
        cell.voiceButton.addTarget(self, action: #selector(recordPresent) , for: .touchDown)
        
        return cell
    }
    @objc func recordPresent() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RecordViewController") as! RecordViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        wordListCLV.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension WordListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == indexSelected {
            if UIDevice.current.userInterfaceIdiom == .pad{
                return CGSize(width: UIScreen.main.bounds.width - 100, height: 189)
            }
            return CGSize(width: (UIScreen.main.bounds.width) - 40, height: 189)
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 129)
        }
        return CGSize(width: (UIScreen.main.bounds.width) - 40, height: 129)
    }
}
