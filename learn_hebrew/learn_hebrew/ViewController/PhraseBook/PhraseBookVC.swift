//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class PhraseBookVC: UIViewController {
    var lesson = 0
    var index = 14
    var listLessonData:[LessonModel] = [LessonModel]()
    var listLanguage: [LangMenuModel] = [LangMenuModel]()
    @IBAction func backBtn() {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var phraseBookTBV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        phraseBookTBV.backgroundColor = UIColor.clear
        phraseBookTBV.separatorStyle = .none
        phraseBookTBV.register(UINib(nibName: "phraseTBVCell", bundle: nil), forCellReuseIdentifier: "phraseTBVCell")
    }
}
extension PhraseBookVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"phraseTBVCell", for: indexPath) as! phraseTBVCell
        cell.myImage.image = UIImage(named: "right")
        if indexPath.row == 0 {
            cell.myLabel.text = "001-010"
        } else if indexPath.row == 1 {
            cell.myLabel.text = "011-020"
        } else if indexPath.row == 2 {
            cell.myLabel.text = "021-030"
        } else if indexPath.row == 3 {
            cell.myLabel.text = "031-040"
        } else if indexPath.row == 4 {
            cell.myLabel.text = "041-050"
        } else if indexPath.row == 5 {
            cell.myLabel.text = "051-060"
        } else if indexPath.row == 6 {
            cell.myLabel.text = "061-070"
        } else if indexPath.row == 7 {
            cell.myLabel.text = "071-080"
        } else if indexPath.row == 8 {
            cell.myLabel.text = "081-090"
        } else if indexPath.row == 9 {
            cell.myLabel.text = "091-100"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LessonVC") as! LessonVC
        vc.lesson = indexPath.row
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true)
    }
}

