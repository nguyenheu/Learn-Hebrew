//
//  recordTBVCell.swift
//  learn_hebrew
//
//  Created by Nguyễn Quốc Hiếu on 20/12/2021.
//

import UIKit

class recordTBVCell: UITableViewCell {

    @IBOutlet weak var recordingName: UILabel!
    @IBOutlet weak var fileName: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var displayLink = CADisplayLink()
    var recorder = AKAudioRecorder.shared
    override func awakeFromNib() {
        super.awakeFromNib()
        slider.setThumbImage(UIImage(named: "slider_circle"), for: .normal) ///   SET SLIDER ITHUMB IMAGE
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            contentView.backgroundColor = UIColor(named: "stop_record")
        } else {
            contentView.backgroundColor = .systemBackground
        }
    }
    
    //MARK:- UPDATE SLIDER
    @objc func updateSliderProgress(){
        
         var progress = recorder.getCurrentTime() / Double(recorder.duration) /// progress 0 -> 1
        
         if recorder.isPlaying == false || progress == .infinity {
             displayLink.invalidate()
             progress = 0.0
         }
        slider.value = Float(progress)  /// Slider value is equal to progress
     }
     
    //MARK:- Run Time Loop for slider
     func playSlider(){
        if recorder.isPlaying{
            displayLink = CADisplayLink(target: self, selector: #selector(self.updateSliderProgress))
            self.displayLink.add(to: RunLoop.current, forMode: RunLoop.Mode.default)
         }
     }
    
}
