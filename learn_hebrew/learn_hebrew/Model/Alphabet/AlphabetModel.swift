//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit

class AlphabetModel
{
    var alphabet_id: Int = 0
    var alphabet_number: Int = 0
    var languageCode: String = ""
    var phonetics: String = ""
    
    init(alphabet_id: Int, alphabet_number: Int, languageCode: String, phonetics: String){
        self.alphabet_id = alphabet_id
        self.alphabet_number = alphabet_number
        self.languageCode = languageCode
        self.phonetics = phonetics
    }
}
