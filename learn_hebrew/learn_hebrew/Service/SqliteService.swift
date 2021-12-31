//
//  LessonModel.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 06/11/2021.
//

import UIKit
import SQLite
//import AVFoundation
//
//class TextToSpeech {
//    static let shared = TextToSpeech()
//    func readText(text: String?){
//        let utterance = AVSpeechUtterance(string: text ?? "")
//        utterance.voice = AVSpeechSynthesisVoice(language: "ko-EN")
//        utterance.rate = 0.1
//        let synthesizer = AVSpeechSynthesizer()
//        synthesizer.speak(utterance)
//    }
//}
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

class LessonFileService:NSObject {

    static let shared: LessonFileService = LessonFileService()
    var DatabaseRoot:Connection?
    var listDataLessonFile:[LessonFileModel] = [LessonFileModel]()
    let users2 = Table("tblLessonFileUrls")
    let id = Expression<Int>("id")
    let targetLanCode = Expression<String>("targetLanCode")
    let nativeLanCode = Expression<String>("nativeLanCode")
    let targetLanName = Expression<String>("targetLanName")
    let nativeLanName = Expression<String>("nativeLanName")
    let url = Expression<String>("url")
    
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
    
    func getDataLessonFile(closure: @escaping (_ response: [LessonFileModel]?, _ error: Error?) -> Void) {

        listDataLessonFile.removeAll()
        if let DatabaseRoot = DatabaseRoot{
            do{
                for user in try DatabaseRoot.prepare(users2) {
                    listDataLessonFile.append(LessonFileModel(id: Int(user[id]),
                                                              targetLanCode: user[targetLanCode],
                                                              nativeLanCode: user[nativeLanCode],
                                                              targetLanName: user[targetLanName],
                                                              nativeLanName: user[nativeLanName],
                                                              url: user[url]))
                }
            } catch  {
                print(error)
            }
        }
        closure(listDataLessonFile, nil)
    }
}

class LessonDataService:NSObject {
    static let shared: LessonDataService = LessonDataService()
    var DatabaseRoot:Connection?
    var listDataLessonData:[LessonDataModel] = [LessonDataModel]()
    let users3 = Table("tblLessonData")
    let lessonDataId = Expression<Int>("lessonDataId")
    let lessonId = Expression<Int>("lessonId")
    let key = Expression<String>("key")
    let value = Expression<String>("value")
    let isStored = Expression<Int>("isStored")
    
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
    
    func getDataLessonData(closure: @escaping (_ response: [LessonDataModel]?, _ error: Error?) -> Void) {

        listDataLessonData.removeAll()
        if let DatabaseRoot = DatabaseRoot{
            do{
                for user in try DatabaseRoot.prepare(users3) {
                    listDataLessonData.append(LessonDataModel(lessonDataId: Int(user[lessonDataId]),
                                                              lessonId: user[lessonId],
                                                              key: user[key],
                                                              value: user[value],
                                                              isStored: user[isStored]))
                }
            } catch  {
                print(error)
            }
        }
        closure(listDataLessonData, nil)
    }
}

class WordService:NSObject {
    static let shared: WordService = WordService()
    var DatabaseRoot:Connection?
    var listDataWord:[WordModel] = [WordModel]()
    let users4 = Table("tblWords")
    let topic_id = Expression<Int>("topic_id")
    let lan_code = Expression<String>("lan_code")
    let word = Expression<String>("word")
    
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
    
    func getDataWord(closure: @escaping (_ response: [WordModel]?, _ error: Error?) -> Void) {

        listDataWord.removeAll()
        if let DatabaseRoot = DatabaseRoot{
            do{
                for user in try DatabaseRoot.prepare(users4) {
                    listDataWord.append(WordModel(topic_id: Int(user[topic_id]),
                                                  lan_code: user[lan_code],
                                                  word: user[word]))
                }
            } catch  {
                print(error)
            }
        }
        closure(listDataWord, nil)
    }
}

class TopicService:NSObject {
    static let shared: TopicService = TopicService()
    var DatabaseRoot:Connection?
    var listDataTopic:[TopicModel] = [TopicModel]()
    let users6 = Table("tblTopics")
    let topic_id = Expression<Int>("topic_id")
    let lan_code = Expression<String>("lan_code")
    let topic = Expression<String>("topic")
    
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
    
    func getDataTopic(closure: @escaping (_ response: [TopicModel]?, _ error: Error?) -> Void) {

        listDataTopic.removeAll()
        if let DatabaseRoot = DatabaseRoot{
            do{
                for user in try DatabaseRoot.prepare(users6) {
                    listDataTopic.append(TopicModel(topic_id: Int(user[topic_id]),
                                                  lan_code: user[lan_code],
                                                  topic: user[topic]))
                }
            } catch  {
                print(error)
            }
        }
        closure(listDataTopic, nil)
    }
}

class AlphabetService:NSObject {
    static let shared: AlphabetService = AlphabetService()
    var DatabaseRoot:Connection?
    var listDataAlphabet:[AlphabetModel] = [AlphabetModel]()
    let users7 = Table("tblAlphabets")
    let alphabet_id = Expression<Int>("alphabet_id")
    let alphabet_number = Expression<Int>("alphabet_number")
    let languageCode = Expression<String>("languageCode")
    let phonetics = Expression<String>("phonetics")
    
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
    
    func getDataAlphabet(closure: @escaping (_ response: [AlphabetModel]?, _ error: Error?) -> Void) {

        listDataAlphabet.removeAll()
        if let DatabaseRoot = DatabaseRoot{
            do{
                for user in try DatabaseRoot.prepare(users7) {
                    listDataAlphabet.append(AlphabetModel(alphabet_id: Int(user[alphabet_id]),
                              alphabet_number: user[alphabet_number],
                                                  languageCode: user[languageCode],
                                                  phonetics: user[phonetics]))
                }
            } catch  {
                print(error)
            }
        }
        closure(listDataAlphabet, nil)
    }
}

class OppositeService:NSObject {
    static let shared: OppositeService = OppositeService()
    var DatabaseRoot:Connection?
    var listDataOpposite:[OppositeModel] = [OppositeModel]()
    let users8 = Table("tblOppositeCouple")
    let serial = Expression<Int>("serial")
    let couple_id = Expression<Int>("couple_id")
    let lang_code = Expression<String>("lang_code")
    let word1 = Expression<String>("word1")
    let word2 = Expression<String>("word2")
    
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
    
    func getDataOpposite(closure: @escaping (_ response: [OppositeModel]?, _ error: Error?) -> Void) {

        listDataOpposite.removeAll()
        if let DatabaseRoot = DatabaseRoot{
            do{
                for user in try DatabaseRoot.prepare(users8) {
                    listDataOpposite.append(OppositeModel(serial: Int(user[serial]),
                                                          couple_id: user[couple_id],
                                                          lang_code: user[lang_code],
                                                          word1: user[word1],
                                                          word2: user[word2]))
                }
            } catch  {
                print(error)
            }
        }
        closure(listDataOpposite, nil)
    }
}
