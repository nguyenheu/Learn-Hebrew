//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class LessonVC: UIViewController {

    var lesson = 0
    var index = 14
    var listLessonData:[LessonModel] = [LessonModel]()
    var listLanguage: [LangMenuModel] = [LangMenuModel]()

    @IBOutlet weak var titleLessonLabel: UILabel!
    @IBOutlet weak var lessonCLV: UICollectionView!
    
    @IBAction func backBtn() {
        dismiss(animated: true, completion: nil)
    }
    let userDefaults = UserDefaults.standard
    let SAVE_KEY = "saveKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lessonCLV.backgroundColor = UIColor.clear
        lessonCLV.register(UINib(nibName: lessonCLVCell.className, bundle: nil), forCellWithReuseIdentifier: lessonCLVCell.className)
        listLanguage = LangMenuData.shared.menu
        SqliteService.shared.getDataLesson(){ listLessonData, error in
            if let listLessonData = listLessonData{
                self.listLessonData = listLessonData
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
        lessonCLV.collectionViewLayout = flowLayout
    }
}

extension LessonVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var image: UIImage!
        
        
        if lesson == 0 {
            titleLessonLabel.text = "Lesson 001-010"
            image = UIImage(named: "0" + "0" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "010")
            }
        } else if lesson == 1 {
            titleLessonLabel.text = "Lesson 011-020"
            image = UIImage(named: "0" + "1" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "020")
            }
        } else if lesson == 2 {
            titleLessonLabel.text = "Lesson 021-030"
            image = UIImage(named: "0" + "2" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "030")
            }
        } else if lesson == 3 {
            titleLessonLabel.text = "Lesson 031-040"
            image = UIImage(named: "0" + "3" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "040")
            }
        } else if lesson == 4 {
            titleLessonLabel.text = "Lesson 041-050"
            image = UIImage(named: "0" + "4" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "050")
            }
        } else if lesson == 5 {
            titleLessonLabel.text = "Lesson 051-060"
            image = UIImage(named: "0" + "5" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "060")
            }
        } else if lesson == 6 {
            titleLessonLabel.text = "Lesson 061-070"
            image = UIImage(named: "0" + "6" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "070")
            }
        } else if lesson == 7 {
            titleLessonLabel.text = "Lesson 071-080"
            image = UIImage(named: "0" + "7" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "080")
            }
        } else if lesson == 8 {
            titleLessonLabel.text = "Lesson 081-090"
            image = UIImage(named: "0" + "8" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "090")
            }
        } else if lesson == 9 {
            titleLessonLabel.text = "Lesson 091-100"
            image = UIImage(named: "0" + "9" + String(indexPath.item + 1))
            if indexPath.item == 9 {
                image = UIImage(named: "100")
            }
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: lessonCLVCell.className, for: indexPath) as! lessonCLVCell
        cell.lessonView.layer.cornerRadius = 16
        cell.lessonView.layer.masksToBounds = true
//        cell.lessonView.layer.shadowRadius = 10
//        cell.lessonView.layer.shadowOpacity = 1
//        cell.lessonView.layer.shadowOffset = CGSize(width: 10, height: 3)
//        cell.lessonView.layer.shadowColor = UIColor.black.cgColor
        cell.lessonImage.image = image
        if self.listLessonData[indexPath.row].languageId == self.listLanguage[indexPath.row].languageId  {
            let fullNameArr:[String] = self.listLessonData[indexPath.row*60 + index + lesson*600].lessonName.components(separatedBy: "@")
           
            cell.lessonLabel.text = fullNameArr[0] // + "  " + fullNameArr[1]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WordListVC") as! WordListVC
        vc.lessonID = listLessonData[indexPath.row*60 + index + lesson*600].lessonId
        vc.lessonIDHebrew = listLessonData[indexPath.row*60 + vc.indexHE + lesson*600].lessonId
        vc.listLessonData = listLessonData
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        return UICollectionReusableView()
    }
    
}

extension LessonVC: UICollectionViewDelegateFlowLayout {
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
            return CGSize(width: (UIScreen.main.bounds.width - 40) / 3 - 20, height: 180)
        }
        return CGSize(width: (UIScreen.main.bounds.width - 40) / 2 - 10, height: 180)
    }
}
