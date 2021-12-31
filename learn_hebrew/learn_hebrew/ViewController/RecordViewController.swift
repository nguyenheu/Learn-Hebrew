//
//  ViewController.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

class RecordViewController: UIViewController {
    @IBAction func backButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var recordTBV: UITableView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordTBV.register(UINib(nibName: "recordTBVCell", bundle: nil), forCellReuseIdentifier: "recordTBVCell")
        recordTBV.isHidden = true
        initialSetup()
    }
    func initialSetup(){
        recordTBV.dataSource = self
        recordTBV.delegate = self
        recordTBV.layer.cornerRadius = 30
        recordTBV.layer.masksToBounds = true
        
        setCircle()
        dismissKeyboard()
    }
    
    @IBAction func recordButton(_ sender: UIButton) {
        if recorder.isRecording{
            animate(isRecording: true)
            recorder.stopRecording()
            recordTBV.isHidden = false
            recordTBV.reloadData()
        } else{
            animate(isRecording: false)
            recorder.record()
            setTimer()
        }
    }
    var recorder = AKAudioRecorder.shared
    var displayLink = CADisplayLink()
    var duration : CGFloat = 0.0
    var timer : Timer!
}
extension RecordViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recorder.getRecordings.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"recordTBVCell", for: indexPath) as! recordTBVCell
        let recording = recorder.getRecordings[indexPath.row]      // FileName
        let name = "New Recording " + String(indexPath.row + 1)    // New Recording 1,2,3...
        cell.recordingName.text = name
        cell.fileName.text =  "FileName :- \(recording)"
        cell.slider.isHidden = true                                 // hide slider
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = recorder.getRecordings[indexPath.row]    // FileName
        recorder.play(name: name)                           //Play
        let cell = tableView.cellForRow(at: indexPath) as! recordTBVCell
        cell.slider.isHidden = false                        //Show slider
        cell.playSlider()
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! recordTBVCell
        cell.slider.isHidden = true                         //hide slider
    }
  
    //MARK:- Delete Recording
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let name = recorder.getRecordings[indexPath.row]
            recorder.deleteRecording(name: name)
            tableView.deleteRows(at: [indexPath], with: .fade)
            learn_hebrew.debugLog("Deleted Recording")
            print(recorder.getRecordings)
        }
    }
}



