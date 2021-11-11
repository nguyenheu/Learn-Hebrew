//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit

class LessonModel
{
    var lessonId: Int = 0
    var lessonNo: String = ""
    var lessonName: String = ""
    var sortNo: Int = 0
    var languageId: Int = 0
    
    init(lessonId: Int, lessonNo: String, lessonName: String, sortNo: Int ,languageId: Int){
        self.lessonId = lessonId
        self.lessonNo = lessonNo
        self.lessonName = lessonName
        self.sortNo = sortNo
        self.languageId = languageId
    }
}
