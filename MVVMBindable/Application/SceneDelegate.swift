//
//  SceneDelegate.swift
//  MVVMBindable
//
//  Created by Marcello Chuahy on 23/08/23.
//

import UIKit

/*
 
 1. Delete the Main.storyboard file from the project. Click Move to Trash.
 
 2. Remove Storyboard Name from info.plist.
 
    --> Info.plist:
        Information Property List
        > Scene Configuration
        > Application Session Role
        > Item 0 (Default Configuration)
        > Storyboard Name
 
 3. Remove "Main" from "UIKit Main Storyboard File Base Name"
 
    --> Project Navigator:
        TARGETS (Your Target)
        > Build Settings
        > Filter: "UIKit Main Storyboard File Base Name"
        > UIKit Main Storyboard File Base Name: delete "Main"

 */

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let viewModel = ViewModel()

        let viewController = ViewController(viewModel: viewModel)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
