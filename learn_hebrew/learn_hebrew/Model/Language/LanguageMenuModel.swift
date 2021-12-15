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
    var languageId: Int
}

class LangMenuData {
    static let shared: LangMenuData = LangMenuData()
    var menu = [
        LangMenuModel(image: UIImage(named: "ad"), textCode: "AD", textName: "адыгабзэ", languageId: 1),
        LangMenuModel(image: UIImage(named: "af"), textCode: "AF", textName: "Afrikaans", languageId: 2),
        LangMenuModel(image: UIImage(named: "am"), textCode: "AM", textName: "አማርኛ", languageId: 3),
        LangMenuModel(image: UIImage(named: "ar"), textCode: "AR", textName: "العربية", languageId: 4),
        LangMenuModel(image: UIImage(named: "be"), textCode: "BE", textName: "беларуская", languageId: 5),
        LangMenuModel(image: UIImage(named: "bg"), textCode: "BG", textName: "български", languageId: 6),
        LangMenuModel(image: UIImage(named: "bn"), textCode: "BN", textName: "বাংলা", languageId: 7),
        LangMenuModel(image: UIImage(named: "bs"), textCode: "BS", textName: "bosanski", languageId: 8),
        LangMenuModel(image: UIImage(named: "ca"), textCode: "CA", textName: "català", languageId: 9),
        LangMenuModel(image: UIImage(named: "cs"), textCode: "CS", textName: "čeština", languageId: 10),
        LangMenuModel(image: UIImage(named: "da"), textCode: "DA", textName: "dansk", languageId: 11),
        LangMenuModel(image: UIImage(named: "de"), textCode: "DE", textName: "Deutsch", languageId: 12),
        LangMenuModel(image: UIImage(named: "el"), textCode: "EL", textName: "ελληνικά", languageId: 13),
        LangMenuModel(image: UIImage(named: "em"), textCode: "EM", textName: "English US", languageId: 14),
        LangMenuModel(image: UIImage(named: "en"), textCode: "EN", textName: "English UK", languageId: 15),
        LangMenuModel(image: UIImage(named: "eo"), textCode: "EO", textName: "esperanto", languageId: 16),
        LangMenuModel(image: UIImage(named: "es"), textCode: "ES", textName: "español", languageId: 17),
        LangMenuModel(image: UIImage(named: "et"), textCode: "ET", textName: "eesti", languageId: 18),
        LangMenuModel(image: UIImage(named: "fa"), textCode: "FA", textName: "فارسی", languageId: 19),
        LangMenuModel(image: UIImage(named: "fi"), textCode: "FI", textName: "suomi", languageId: 20),
        LangMenuModel(image: UIImage(named: "fr"), textCode: "FR", textName: "français", languageId: 21),
        LangMenuModel(image: UIImage(named: "he"), textCode: "HE", textName: "עברית", languageId: 22),
        LangMenuModel(image: UIImage(named: "hi"), textCode: "HI", textName: "हिन्दी", languageId: 23),
        LangMenuModel(image: UIImage(named: "hr"), textCode: "HR", textName: "hrvatski", languageId: 24),
        LangMenuModel(image: UIImage(named: "hu"), textCode: "HU", textName: "magyar", languageId: 25),
        LangMenuModel(image: UIImage(named: "hy"), textCode: "HY", textName: "հայերեն", languageId: 26),
        LangMenuModel(image: UIImage(named: "id"), textCode: "ID", textName: "bahasa Indonesia", languageId: 27),
        LangMenuModel(image: UIImage(named: "it"), textCode: "IT", textName: "italiano", languageId: 28),
        LangMenuModel(image: UIImage(named: "ja"), textCode: "JA", textName: "日本語", languageId: 29),
        LangMenuModel(image: UIImage(named: "ka"), textCode: "KA", textName: "ქართული", languageId: 30),
        LangMenuModel(image: UIImage(named: "kk"), textCode: "KK", textName: "қазақша", languageId: 31),
        LangMenuModel(image: UIImage(named: "kn"), textCode: "KN", textName: "ಕನ್ನಡ", languageId: 32),
        LangMenuModel(image: UIImage(named: "ko"), textCode: "KO", textName: "한국어", languageId: 33),
        LangMenuModel(image: UIImage(named: "lt"), textCode: "LT", textName: "lietuvių", languageId: 34),
        LangMenuModel(image: UIImage(named: "lv"), textCode: "LV", textName: "latviešu", languageId: 35),
        LangMenuModel(image: UIImage(named: "mk"), textCode: "MK", textName: "македонски", languageId: 36),
        LangMenuModel(image: UIImage(named: "mr"), textCode: "MR", textName: "मराठी", languageId: 37),
        LangMenuModel(image: UIImage(named: "nl"), textCode: "NL", textName: "Nederlands", languageId: 38),
        LangMenuModel(image: UIImage(named: "nn"), textCode: "NN", textName: "nynorsk", languageId: 39),
        LangMenuModel(image: UIImage(named: "no"), textCode: "NO", textName: "norsk", languageId: 40),
        LangMenuModel(image: UIImage(named: "pa"), textCode: "PA", textName: "ਪੰਜਾਬੀ", languageId: 41),
        LangMenuModel(image: UIImage(named: "pl"), textCode: "PL", textName: "polski", languageId: 42),
        LangMenuModel(image: UIImage(named: "pt"), textCode: "PT", textName: "português PT", languageId: 43),
        LangMenuModel(image: UIImage(named: "px"), textCode: "PX", textName: "português BR", languageId: 44),
        LangMenuModel(image: UIImage(named: "ro"), textCode: "RO", textName: "română", languageId: 45),
        LangMenuModel(image: UIImage(named: "ru"), textCode: "RU", textName: "русский", languageId: 46),
        LangMenuModel(image: UIImage(named: "sk"), textCode: "SK", textName: "slovenčina", languageId: 47),
        LangMenuModel(image: UIImage(named: "sl"), textCode: "SL", textName: "slovenščina", languageId: 48),
        LangMenuModel(image: UIImage(named: "sq"), textCode: "SQ", textName: "Shqip", languageId: 49),
        LangMenuModel(image: UIImage(named: "sr"), textCode: "SR", textName: "српски", languageId: 50),
        LangMenuModel(image: UIImage(named: "sv"), textCode: "SV", textName: "svenska", languageId: 51),
        LangMenuModel(image: UIImage(named: "ta"), textCode: "TA", textName: "தமிழ்", languageId: 52),
        LangMenuModel(image: UIImage(named: "te"), textCode: "TE", textName: "తెలుగు", languageId: 53),
        LangMenuModel(image: UIImage(named: "th"), textCode: "TH", textName: "ภาษาไทย", languageId: 54),
        LangMenuModel(image: UIImage(named: "ti"), textCode: "TI", textName: "ትግርኛ", languageId: 55),
        LangMenuModel(image: UIImage(named: "tr"), textCode: "TR", textName: "Türkçe", languageId: 56),
        LangMenuModel(image: UIImage(named: "uk"), textCode: "UK", textName: "українська", languageId: 57),
        LangMenuModel(image: UIImage(named: "ur"), textCode: "UR", textName: "اردو", languageId: 58),
        LangMenuModel(image: UIImage(named: "vi"), textCode: "VI", textName: "Tiếng Việt", languageId: 59),
        LangMenuModel(image: UIImage(named: "zh"), textCode: "ZH", textName: "中文", languageId: 60),
    ]
}
