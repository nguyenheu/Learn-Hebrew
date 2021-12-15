//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit

class WordModel
{
    var word_id: Int = 0
    var lan_code: String = ""
    var word: String = ""
    
    init(word_id: Int, lan_code: String, word: String){
        self.word_id = word_id
        self.lan_code = lan_code
        self.word = word
    }
}
