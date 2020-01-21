//
//  AppDelegate.swift
//  ExamWork
//
//  Created by Александр Арсенюк on 21.01.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
