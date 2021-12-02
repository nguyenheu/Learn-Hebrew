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
    var listDataLesson:[LessonModel] = [LessonModel]()
    let users1 = Table("tblLesson")
    let lessonId = Expression<Int>("lessonId")
    let lessonNo = Expression<String>("lessonNo")
    let lessonName = Expression<String>("lessonName")
    let sortNo = Expression<Int>("sortNo")
    let languageId = Expression<Int>("languageId")
    
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
    
    func getDataLesson(closure: @escaping (_ response: [LessonModel]?, _ error: Error?) -> Void) {

        listDataLesson.removeAll()
        if let DatabaseRoot = DatabaseRoot{
            do{
                for user in try DatabaseRoot.prepare(users1) {
                    listDataLesson.append(LessonModel(lessonId: Int(user[lessonId]),
                                                      lessonNo: user[lessonNo],
                                                      lessonName: user[lessonName],
                                                      sortNo: user[sortNo],
                                                      languageId: user[languageId]))
                }
            } catch  {
                print(error)
            }
        }
        closure(listDataLesson, nil)
    }
}
