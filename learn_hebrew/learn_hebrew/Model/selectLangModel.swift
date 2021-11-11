//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit

class selectLangModel
{
    var languageId: Int = 0
    var languageName: String = ""
    var languageCode: String = ""
    init(languageId: Int, languageName: String, languageCode: String){
        self.languageId = languageId
        self.languageName = languageName
        self.languageCode = languageCode
    }
}
