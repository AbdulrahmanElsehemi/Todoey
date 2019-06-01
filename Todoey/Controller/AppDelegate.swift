//
//  AppDelegate.swift
//  Todoey
//
//  Created by Abdelrahman on 5/18/19.
//  Copyright © 2019 Abdelrahman. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
       // print(Realm.Configuration.defaultConfiguration.fileURL )
      
        do{
            _ = try Realm()
            
        }catch{
            print("Error init new Realm \(error)")
        }
        
        
        
        return true
    }



   
    // MARK: - Core Data stack
   


}

