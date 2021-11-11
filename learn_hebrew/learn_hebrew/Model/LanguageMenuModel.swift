//
//  LanguageMenuModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 11/11/2021.
//

import Foundation
import UIKit

struct LangMenuModel {
    var image : UIImage!
    var textCode: String
    var textName: String
}

class LangMenuData {
    static let shared: LangMenuData = LangMenuData()
    var menu = [
        LangMenuModel(image: UIImage(named: "ad"), textCode: "AD", textName: "адыгабзэ"),
        LangMenuModel(image: UIImage(named: "af"), textCode: "AF", textName: "Afrikaans"),
        LangMenuModel(image: UIImage(named: "am"), textCode: "AM", textName: "አማርኛ"),
        LangMenuModel(image: UIImage(named: "ar"), textCode: "AR", textName: "العربية"),
        LangMenuModel(image: UIImage(named: "be"), textCode: "BE", textName: "беларуская"),
        LangMenuModel(image: UIImage(named: "bg"), textCode: "BG", textName: "български"),
        LangMenuModel(image: UIImage(named: "bn"), textCode: "BN", textName: "বাংলা"),
        LangMenuModel(image: UIImage(named: "bs"), textCode: "BS", textName: "bosanski"),
        LangMenuModel(image: UIImage(named: "ca"), textCode: "CA", textName: "català"),
        LangMenuModel(image: UIImage(named: "cs"), textCode: "CS", textName: "čeština"),
        LangMenuModel(image: UIImage(named: "da"), textCode: "DA", textName: "dansk"),
        LangMenuModel(image: UIImage(named: "de"), textCode: "DE", textName: "Deutsch"),
        LangMenuModel(image: UIImage(named: "el"), textCode: "EL", textName: "ελληνικά"),
        LangMenuModel(image: UIImage(named: "em"), textCode: "EM", textName: "English US"),
        LangMenuModel(image: UIImage(named: "en"), textCode: "EN", textName: "English UK"),
        LangMenuModel(image: UIImage(named: "eo"), textCode: "EO", textName: "esperanto"),
        LangMenuModel(image: UIImage(named: "es"), textCode: "ES", textName: "español"),
        LangMenuModel(image: UIImage(named: "et"), textCode: "ET", textName: "eesti"),
        LangMenuModel(image: UIImage(named: "fa"), textCode: "FA", textName: "فارسی"),
        LangMenuModel(image: UIImage(named: "fi"), textCode: "FI", textName: "suomi"),
        LangMenuModel(image: UIImage(named: "fr"), textCode: "FR", textName: "français"),
        LangMenuModel(image: UIImage(named: "he"), textCode: "HE", textName: "עברית"),
        LangMenuModel(image: UIImage(named: "hi"), textCode: "HI", textName: "हिन्दी"),
        LangMenuModel(image: UIImage(named: "hr"), textCode: "HR", textName: "hrvatski"),
        LangMenuModel(image: UIImage(named: "hu"), textCode: "HU", textName: "magyar"),
        LangMenuModel(image: UIImage(named: "hy"), textCode: "HY", textName: "հայերեն"),
        LangMenuModel(image: UIImage(named: "id"), textCode: "ID", textName: "bahasa Indonesia"),
        LangMenuModel(image: UIImage(named: "it"), textCode: "IT", textName: "italiano"),
        LangMenuModel(image: UIImage(named: "ja"), textCode: "JA", textName: "日本語"),
        LangMenuModel(image: UIImage(named: "ka"), textCode: "KA", textName: "ქართული"),
        LangMenuModel(image: UIImage(named: "kk"), textCode: "KK", textName: "қазақша"),
        LangMenuModel(image: UIImage(named: "kn"), textCode: "KN", textName: "ಕನ್ನಡ"),
        LangMenuModel(image: UIImage(named: "ko"), textCode: "KO", textName: "한국어"),
        LangMenuModel(image: UIImage(named: "lt"), textCode: "LT", textName: "lietuvių"),
        LangMenuModel(image: UIImage(named: "lv"), textCode: "LV", textName: "latviešu"),
        LangMenuModel(image: UIImage(named: "mk"), textCode: "MK", textName: "македонски"),
        LangMenuModel(image: UIImage(named: "mr"), textCode: "MR", textName: "मराठी"),
        LangMenuModel(image: UIImage(named: "nl"), textCode: "NL", textName: "Nederlands"),
        LangMenuModel(image: UIImage(named: "nn"), textCode: "NN", textName: "nynorsk"),
        LangMenuModel(image: UIImage(named: "no"), textCode: "NO", textName: "norsk"),
        LangMenuModel(image: UIImage(named: "pa"), textCode: "PA", textName: "ਪੰਜਾਬੀ"),
        LangMenuModel(image: UIImage(named: "pl"), textCode: "PL", textName: "polski"),
        LangMenuModel(image: UIImage(named: "pt"), textCode: "PT", textName: "português PT"),
        LangMenuModel(image: UIImage(named: "px"), textCode: "PX", textName: "português BR"),
        LangMenuModel(image: UIImage(named: "ro"), textCode: "RO", textName: "română"),
        LangMenuModel(image: UIImage(named: "ru"), textCode: "RU", textName: "русский"),
        LangMenuModel(image: UIImage(named: "sk"), textCode: "SK", textName: "slovenčina"),
        LangMenuModel(image: UIImage(named: "sl"), textCode: "SL", textName: "slovenščina"),
        LangMenuModel(image: UIImage(named: "sq"), textCode: "SQ", textName: "Shqip"),
        LangMenuModel(image: UIImage(named: "sr"), textCode: "SR", textName: "српски"),
        LangMenuModel(image: UIImage(named: "sv"), textCode: "SV", textName: "svenska"),
        LangMenuModel(image: UIImage(named: "ta"), textCode: "TA", textName: "தமிழ்"),
        LangMenuModel(image: UIImage(named: "te"), textCode: "TE", textName: "తెలుగు"),
        LangMenuModel(image: UIImage(named: "th"), textCode: "TH", textName: "ภาษาไทย"),
        LangMenuModel(image: UIImage(named: "ti"), textCode: "TI", textName: "ትግርኛ"),
        LangMenuModel(image: UIImage(named: "tr"), textCode: "TR", textName: "Türkçe"),
        LangMenuModel(image: UIImage(named: "uk"), textCode: "UK", textName: "українська"),
        LangMenuModel(image: UIImage(named: "ur"), textCode: "UR", textName: "اردو"),
        LangMenuModel(image: UIImage(named: "vi"), textCode: "VI", textName: "Tiếng Việt"),
        LangMenuModel(image: UIImage(named: "zh"), textCode: "ZH", textName: "中文"),
    ]
}
