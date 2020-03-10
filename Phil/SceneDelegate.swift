//
//  SceneDelegate.swift
//  Phil
//
//  Created by Phil Cappelli on 2/10/20.
//  Copyright © 2020 Phil Cappelli. All rights reserved.
//

import UIKit
import Branch

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let userActivity = connectionOptions.userActivities.first {
            Branch.getInstance().continue(userActivity)
        }
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        Branch.getInstance().continue(userActivity)
        
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let context = URLContexts.first else { return }
        Branch.getInstance().application(nil, open: context.url, sourceApplication: context.options.sourceApplication, annotation: context.options.annotation)
    }

}

