//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit
import OSSSpeechKit
class NumberVC: UIViewController {

    
    var index = 14
    var indexHE = 21
    var lesson = 0
    var listLessonData:[LessonModel] = [LessonModel]()
    var listLessonFullData: [LessonDataModel] = [LessonDataModel]()
    @IBOutlet weak var numberCLV: UICollectionView!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    let userDefaults = UserDefaults.standard
    let SAVE_KEY = "saveKey"
    override func viewDidLoad() {
        super.viewDidLoad()
        numberCLV.backgroundColor = UIColor.clear
        numberCLV.register(UINib(nibName: audioCLVCell.className, bundle: nil), forCellWithReuseIdentifier: audioCLVCell.className)
        
        SqliteService.shared.getDataLesson(){ listLessonData, error in
            if let listLessonData = listLessonData{
                self.listLessonData = listLessonData
            }
        }
        LessonDataService.shared.getDataLessonData(){ listLessonFullData, error in
            if let listLessonFullData = listLessonFullData{
                self.listLessonFullData = listLessonFullData
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
        numberCLV.collectionViewLayout = flowLayout
    }
}

extension NumberVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: audioCLVCell.className, for: indexPath) as! audioCLVCell
        let fullNameArr:[String] = self.listLessonFullData[indexPath.row*1200 + index*20 + lesson*1200].value.components(separatedBy: "@")

        cell.languageLabel.text = fullNameArr[0]
        
        let fullNameArr2:[String] = self.listLessonFullData[indexPath.row*1200 + indexHE*20 + lesson*1200].value.components(separatedBy: "@")
        cell.heLanguageLabel.text = fullNameArr2[0]
        cell.translateLanguageLabel.text = fullNameArr2[1]
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

extension NumberVC: UICollectionViewDelegateFlowLayout {
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
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 129)
        }
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 129)
    }
}
