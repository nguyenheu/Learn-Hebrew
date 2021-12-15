//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit

class OppositeModel
{
    var serial: Int = 0
    var couple_id: Int = 0
    var lang_code: String = ""
    var word1: String = ""
    var word2: String = ""
    
    init(serial: Int, couple_id: Int, lang_code: String, word1: String, word2: String){
        self.serial = serial
        self.couple_id = couple_id
        self.lang_code = lang_code
        self.word1 = word1
        self.word2 = word2
    }
}
