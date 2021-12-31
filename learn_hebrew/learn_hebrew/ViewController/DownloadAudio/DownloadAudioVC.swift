//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class DownloadAuioVC: UIViewController {

    var listLessonDataFile:[LessonFileModel] = [LessonFileModel]()
    
    @IBOutlet weak var downloadCLV: UICollectionView!
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func downloadAudioButton(_ sender: Any) {
        if downloadCLV.isHidden == true {
            downloadCLV.isHidden = false
        } else {
            downloadCLV.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadCLV.backgroundColor = UIColor.clear
        downloadCLV.register(UINib(nibName: langCLVCell2.className, bundle: nil), forCellWithReuseIdentifier: langCLVCell2.className)
        
        LessonFileService.shared.getDataLessonFile(){ listLessonDataFile, error in
            if let listLessonDataFile = listLessonDataFile{
                self.listLessonDataFile = listLessonDataFile
            }
        }
        downloadCLV.isHidden = true
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
        downloadCLV.collectionViewLayout = flowLayout
    }
//    func extractZipFile() {
//        let fileManager = FileManager()
//        let currentWorkingPath = fileManager.currentDirectoryPath
//        var sourceURL = URL(fileURLWithPath: currentWorkingPath)
//        sourceURL.appendPathComponent("archive.zip")
//        var destinationURL = URL(fileURLWithPath: currentWorkingPath)
//        destinationURL.appendPathComponent("directory")
//        do {
//            try fileManager.createDirectory(at: destinationURL, withIntermediateDirectories: true, attributes: nil)
//            try fileManager.unzip
//        } catch {
//            print("Extraction of ZIP archive failed with error:\(error)")
//        }
//    }
}

extension DownloadAuioVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: langCLVCell2.className, for: indexPath) as! langCLVCell2
        cell.lineImage.image = UIImage(named: "line")
        cell.myLabel.text = "a"
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

extension DownloadAuioVC: UICollectionViewDelegateFlowLayout {
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
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 60)
        }
        return CGSize(width: UIScreen.main.bounds.width - 15, height: 60)
    }
}
