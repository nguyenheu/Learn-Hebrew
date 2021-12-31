//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class VocabularyVC: UIViewController {
    var index = 14
    var indexHE = 21
    var topicId = 0
    var listTopic:[TopicModel] = [TopicModel]()
    var listDataTopic:[TopicModel] = [TopicModel]()
    
    @IBOutlet weak var vocabCLV: UICollectionView!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    let userDefaults = UserDefaults.standard
    let SAVE_KEY = "saveKey"
    override func viewDidLoad() {
        super.viewDidLoad()
        vocabCLV.backgroundColor = UIColor.clear
        vocabCLV.register(UINib(nibName: vocabCLVCell.className, bundle: nil), forCellWithReuseIdentifier: vocabCLVCell.className)

        TopicService.shared.getDataTopic(){ listDataTopic, error in
            if let listDataTopic = listDataTopic{
                self.listDataTopic = listDataTopic
                self.getListTopic()
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
        vocabCLV.collectionViewLayout = flowLayout
    }
    func getListTopic() {
        for item in 1..<listDataTopic.count {
            if listDataTopic[item].lan_code == "HE"
            {
                listTopic.append(listDataTopic[item])
            }
        }
    }
    
}

extension VocabularyVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTopic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: vocabCLVCell.className, for: indexPath) as! vocabCLVCell
        cell.vocabSubView.layer.cornerRadius = 16
        cell.vocabSubView.layer.shadowOpacity = 0.1
        cell.vocabSubView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        cell.vocabSubView.layer.shadowRadius = 0.0
        cell.vocabSubView.layer.shadowColor = UIColor.black.cgColor
        
        let fullNameArr:[String] = self.listDataTopic[indexPath.row + indexHE*42].topic.components(separatedBy: "@")
        cell.heLanguageLabel.text = fullNameArr[0]
        cell.translateLanguageLabel.text = fullNameArr[1]
        if index == 54{
            let fullNameArr2:[String] = self.listDataTopic[indexPath.row + 14*42].topic.components(separatedBy: "@")
            cell.otherLanguageLabel.text = fullNameArr2[0]
        } else if index < 54 {
            let fullNameArr3:[String] = self.listDataTopic[indexPath.row + index*42].topic.components(separatedBy: "@")
            cell.otherLanguageLabel.text = fullNameArr3[0]
        } else if index > 54 {
            let fullNameArr3:[String] = self.listDataTopic[indexPath.row + (index-1)*42].topic.components(separatedBy: "@")
            cell.otherLanguageLabel.text = fullNameArr3[0]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VocabDetailVC") as! VocabDetailVC

        if index == 54 {
            let fullNameArr2:[String] = self.listDataTopic[indexPath.row + 14*42].topic.components(separatedBy: "@")
            vc.wordString = fullNameArr2[0]
            vc.topicId = listDataTopic[indexPath.row+14*42].topic_id
            vc.topicIdHE = listDataTopic[indexPath.row + indexHE*42].topic_id
            vc.word = self.listDataTopic[indexPath.row+14*42].lan_code
            vc.wordHE = self.listDataTopic[indexPath.row+indexHE*42].lan_code
        } else if index < 54 {
            let fullNameArr3:[String] = self.listDataTopic[indexPath.row + index*42].topic.components(separatedBy: "@")
            vc.wordString = fullNameArr3[0]
            vc.topicId = listDataTopic[indexPath.row+index*42].topic_id
            vc.topicIdHE = listDataTopic[indexPath.row + indexHE*42].topic_id
            vc.word = self.listDataTopic[indexPath.row+index*42].lan_code
            vc.wordHE = self.listDataTopic[indexPath.row+indexHE*42].lan_code
        } else if index > 54 {
            let fullNameArr3:[String] = self.listDataTopic[indexPath.row + (index-1)*42].topic.components(separatedBy: "@")
            vc.wordString = fullNameArr3[0]
            vc.topicId = listDataTopic[indexPath.row+(index-1)*42].topic_id
            vc.topicIdHE = listDataTopic[indexPath.row + indexHE*42].topic_id
            vc.word = self.listDataTopic[indexPath.row+(index-1)*42].lan_code
            vc.wordHE = self.listDataTopic[indexPath.row+indexHE*42].lan_code
        }
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension VocabularyVC: UICollectionViewDelegateFlowLayout {
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
