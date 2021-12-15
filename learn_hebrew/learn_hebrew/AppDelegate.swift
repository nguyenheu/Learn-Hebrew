//
//  AppDelegate.swift
//  learn_hebrew
//
//  Created by devsenior_hew on 03/11/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let pathForFile = Bundle.main.path(forResource: "db", ofType: "db"){
            SqliteService.shared.loadInit(linkPath: pathForFile)
            LessonDataService.shared.loadInit(linkPath: pathForFile)
            LessonFileService.shared.loadInit(linkPath: pathForFile)
            WordService.shared.loadInit(linkPath: pathForFile)
            TopicService.shared.loadInit(linkPath: pathForFile)
            AlphabetService.shared.loadInit(linkPath: pathForFile)
            OppositeService.shared.loadInit(linkPath: pathForFile)
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

