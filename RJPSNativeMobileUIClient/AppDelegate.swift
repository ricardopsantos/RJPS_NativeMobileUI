//
//  AppDelegate.swift
//  RJSSecuritySampleClient
//
//  Created by Ricardo Santos on 14/01/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print("#################### screenProfile")
        print(String(data: try! JSONEncoder().encode(ComponentModel.screenProfile), encoding: .utf8)!)
        print("#################### screenDesignables")
        print(String(data: try! JSONEncoder().encode(ComponentModel.screenDesignables), encoding: .utf8)!)

        return true
    }

}

