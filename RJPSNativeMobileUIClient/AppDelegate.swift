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
        
        print("#################### screenA")
        print(String(data: try! JSONEncoder().encode(ComponentModel.screenA), encoding: .utf8)!)
        print("#################### screenB")
        print(String(data: try! JSONEncoder().encode(ComponentModel.screenB), encoding: .utf8)!)
        print("#################### screenC")
        print(String(data: try! JSONEncoder().encode(ComponentModel.screenC), encoding: .utf8)!)
        print("#################### screenD")
        print(String(data: try! JSONEncoder().encode(ComponentModel.screenD), encoding: .utf8)!)
                
        return true
    }

}

