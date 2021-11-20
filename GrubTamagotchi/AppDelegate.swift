//
//  AppDelegate.swift
//  GrubTamagotchi
//
//  Created by user204206 on 11/13/21.
//

import UIKit
import Parse

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let parseConfig = ParseClientConfiguration {
                    $0.applicationId = "DZy37Ss6gxfh6OMqfRE1m1dpxox1aDyCMPkvdxX1" // <- UPDATE 3t6uHHUPAMmd5Ljnv9VujczqY5zcADGWA0PrJOBi (Narmeen)
                    $0.clientKey = "jgjQsPnNG3A22sMJa4iDKYT4ouWLa0kMkV49D0oF" // <- UPDATE INXx08nDK9Vysr4ICnjetgK5ws9cmhTmaqn83xBF (Narmeen)
                    $0.server = "https://parseapi.back4app.com"
            }
            Parse.initialize(with: parseConfig)
        
        
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

