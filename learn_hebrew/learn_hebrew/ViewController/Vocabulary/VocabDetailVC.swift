//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class VocabDetailVC: UIViewController {
    var index = 14
    var indexHE = 21
    var topicId = 0
    var topicIdHebrew = 0
    var lesson = 0
//    var mainString = ""
    var listDataWord:[WordModel] = [WordModel]()
    var listDataTopic:[TopicModel] = [TopicModel]()
    var listWord:[WordModel] = [WordModel]()
    var listWordHE:[WordModel] = [WordModel]()
    @IBOutlet weak var vocabDetailCLV: UICollectionView!
    @IBOutlet weak var mainDetailLabel: UILabel!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        vocabDetailCLV.backgroundColor = UIColor.clear
        vocabDetailCLV.register(UINib(nibName: audioCLVCell.className, bundle: nil), forCellWithReuseIdentifier: audioCLVCell.className)

        WordService.shared.getDataWord(){ listDataWord, error in
            if let listDataWord = listDataWord{
                self.listDataWord = listDataWord
                self.getListWord()
                self.getListWordHE()
                self.vocabDetailCLV.reloadData()
            }
        }
        
        TopicService.shared.getDataTopic(){ listDataTopic, error in
            if let listDataTopic = listDataTopic{
                self.listDataTopic = listDataTopic
                
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
        vocabDetailCLV.collectionViewLayout = flowLayout
    }
    func getListWord() {
        for item in listDataWord {
            if item.word_id == topicId {
                listWord.append(item)
            }
        }
    }
    func getListWordHE() {
        for item in listDataWord {
            if item.word_id == topicId {
                listWordHE.append(item)
            }
        }
    }
}

extension VocabDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listWord.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: audioCLVCell.className, for: indexPath) as! audioCLVCell
        let fullNameArr:[String] = self.listDataWord[indexPath.row + indexHE + lesson*topicId].word.components(separatedBy: "@")

        cell.heLanguageLabel.text = fullNameArr[0]
        cell.translateLanguageLabel.text = fullNameArr[1]

//        if index == 54{
//            let fullNameArr2:[String] = self.listDataWord[indexPath.row + 14*topicId + lesson*1904].word.components(separatedBy: "@")
//            cell.languageLabel.text = fullNameArr2[0]
//        } else if index < 54 {
//            let fullNameArr3:[String] = self.listDataWord[indexPath.row + index*topicId + lesson*1904].word.components(separatedBy: "@")
//            cell.languageLabel.text = fullNameArr3[0]
//        } else if index > 54 {
//            let fullNameArr3:[String] = self.listDataWord[indexPath.row + (index-1)*topicId + lesson*1904].word.components(separatedBy: "@")
//            cell.languageLabel.text = fullNameArr3[0]
//        }
        
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

extension VocabDetailVC: UICollectionViewDelegateFlowLayout {
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
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 129)
        }
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 129)
    }
}
