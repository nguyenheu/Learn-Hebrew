//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit

class WordModel
{
    var topic_id: Int = 0
    var lan_code: String = ""
    var word: String = ""
    
    init(topic_id: Int, lan_code: String, word: String){
        self.topic_id = topic_id
        self.lan_code = lan_code
        self.word = word
    }
}
