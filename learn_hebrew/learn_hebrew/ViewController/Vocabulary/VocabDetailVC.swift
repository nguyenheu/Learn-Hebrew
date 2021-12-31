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
    var topicIdHE = 0
    var wordString = ""
    var word : String = ""
    var wordHE : String = ""
    var listDataWord:[WordModel] = [WordModel]()
    var listTopicId:[WordModel] = [WordModel]()
    var listTopicIdHE:[WordModel] = [WordModel]()
    var listTopicIdFilter:[WordModel] = [WordModel]()
    
    var allTopic: [[WordModel]] = [[]]
    
    @IBOutlet weak var vocabDetailCLV: UICollectionView!
    @IBOutlet weak var mainDetailLabel: UILabel!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        vocabDetailCLV.backgroundColor = UIColor.clear
        vocabDetailCLV.register(UINib(nibName: vocabCLVCell.className, bundle: nil), forCellWithReuseIdentifier: vocabCLVCell.className)
        mainDetailLabel.text = wordString

        WordService.shared.getDataWord(){ listDataWord, error in
            if let listDataWord = listDataWord{
                self.listDataWord = listDataWord
                self.getTopicId()
                self.getTopicIdHE()
                self.vocabDetailCLV.reloadData()
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
    func getTopicId() {
        for i in listDataWord{
            listTopicIdFilter.removeAll()
            if i.topic_id == topicId{
                listTopicIdFilter.append(i)
                for j in listTopicIdFilter {
                    if j.lan_code == word {
                        listTopicId.append(j)
                    }
                }
            }
        }
    }
    func getTopicIdHE() {
        for i in listDataWord{
            listTopicIdFilter.removeAll()
            if i.topic_id == topicId{
                listTopicIdFilter.append(i)
                for j in listTopicIdFilter {
                    if j.lan_code == wordHE {
                        listTopicIdHE.append(j)
                    }
                }
            }
        }
    }
}

extension VocabDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTopicId.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: vocabCLVCell.className, for: indexPath) as! vocabCLVCell
        cell.vocabSubView.layer.cornerRadius = 16
        cell.vocabSubView.layer.shadowOpacity = 0.1
        cell.vocabSubView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        cell.vocabSubView.layer.shadowRadius = 0.0
        cell.vocabSubView.layer.shadowColor = UIColor.black.cgColor
        
        let fullNameArr:[String] = self.listTopicIdHE[indexPath.row].word.components(separatedBy: "@")
        cell.heLanguageLabel.text = fullNameArr[0]
        cell.translateLanguageLabel.text = fullNameArr[1]
        
        if index == 54 {
            let fullNameArr2:[String] = self.listTopicId[indexPath.row].word.components(separatedBy: "@")
            cell.otherLanguageLabel.text = fullNameArr2[0]
        } else if index < 54 {
            let fullNameArr3:[String] = self.listTopicId[indexPath.row].word.components(separatedBy: "@")
            cell.otherLanguageLabel.text = fullNameArr3[0]
        } else if index > 54 {
            let fullNameArr3:[String] = self.listTopicId[indexPath.row].word.components(separatedBy: "@")
            cell.otherLanguageLabel.text = fullNameArr3[0]
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

extension VocabDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 120)
        }
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 120)
    }
}
