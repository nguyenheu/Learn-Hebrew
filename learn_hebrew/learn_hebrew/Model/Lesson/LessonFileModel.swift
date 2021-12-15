//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit

class LessonFileModel
{
    var id: Int = 0
    var targetLanCode: String = ""
    var nativeLanCode: String = ""
    var targetLanName: String = ""
    var nativeLanName: String = ""
    var url: String = ""
    
    init(id: Int, targetLanCode: String, nativeLanCode: String, targetLanName: String ,nativeLanName: String, url: String){
        self.id = id
        self.targetLanCode = targetLanCode
        self.nativeLanCode = nativeLanCode
        self.targetLanName = targetLanName
        self.nativeLanName = nativeLanName
        self.url = url
    }
}
