//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit

class LessonDataModel
{
    var lessonDataId: Int = 0
    var lessonId: Int = 0
    var key: String = ""
    var value: String = ""
    var isStored: Int = 0
    
    init(lessonDataId: Int, lessonId: Int, key: String, value: String ,isStored: Int){
        self.lessonDataId = lessonDataId
        self.lessonId = lessonId
        self.key = key
        self.value = value
        self.isStored = isStored
    }
}
