//
//  AppDelegate.swift
//  PuzzleLayout
//
//  Created by Stephen Paul Brown on 2/2/17.
//  Copyright © 2017 Stephen Paul Brown. All rights reserved.
//

import UIKit

func sandboxArchivePath() -> String {
    let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
    return dir.appendingPathComponent("numbers.plist")
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var board : FifteenBoard?
    let numShuffles = 150 // Used to scramble board
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.board = FifteenBoard()
        self.board!.scramble(numTimes: numShuffles)

        
        let archiveName = sandboxArchivePath()
        if FileManager.default.fileExists(atPath: archiveName) { // If saved file exists, load it, otherwise shuffle
            let savedState = NSArray(contentsOfFile: archiveName) as! [[Int]] // Grab saved state and cast it to a double int array
            board!.state = savedState // Set state to the saved state
        }
        else {
           self.board!.scramble(numTimes: numShuffles)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        let archiveName = sandboxArchivePath()
        let savedState : NSArray = board!.state as NSArray // Saved the state as an NS array
        savedState.write(toFile : archiveName, atomically : true) // Write to the archive
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        let archiveName = sandboxArchivePath()
        let savedState : NSArray = board!.state as NSArray
        savedState.write(toFile : archiveName, atomically : true)
    }


}

