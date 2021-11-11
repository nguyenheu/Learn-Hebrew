//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit
import SQLite
class SqliteService:NSObject {
    static let shared: SqliteService = SqliteService()
    var DatabaseRoot:Connection?
    var listDataSelectLang:[selectLangModel] = [selectLangModel]()
    let users1 = Table("tblLanguage")
    let languageId = Expression<Int>("languageId")
    let languageName = Expression<String>("languageName")
    let languageCode = Expression<String>("languageCode")
    
    func loadInit(linkPath:String){
        var dbPath : String = ""
        var dbResourcePath : String = ""
        
        let fileManager = FileManager.default
        do{
            dbPath = try fileManager
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("db.db")
                .path
            if !fileManager.fileExists(atPath: dbPath) {
                dbResourcePath = Bundle.main.path(forResource: "db", ofType: "db")!
                try fileManager.copyItem(atPath: dbResourcePath, toPath: dbPath)
            }
        }catch{
            print("An error has occured")
        }
        do {
            self.DatabaseRoot = try Connection (dbPath)
        } catch {
            print(error)
        }
    }
    
    func getDataSelectLang(closure: @escaping (_ response: [selectLangModel]?, _ error: Error?) -> Void) {

        listDataSelectLang.removeAll()
        if let DatabaseRoot = DatabaseRoot{
            do{
                for user in try DatabaseRoot.prepare(users1) {
                    listDataSelectLang.append(selectLangModel(languageId: Int(user[languageId]),
                                                 languageName: user[languageName],
                                                 languageCode: user[languageCode]))
                }
            } catch  {
                print(error)
            }
        }
        closure(listDataSelectLang, nil)
    }
}
