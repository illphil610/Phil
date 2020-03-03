//
//  DeeplinkNavigator.swift
//  Phil
//
//  Created by Phil Cappelli on 3/2/20.
//  Copyright © 2020 Phil Cappelli. All rights reserved.
//

import UIKit

class DeeplinkNavigator {
    static let shared = DeeplinkNavigator()
    
    func navigate(with deepLinkColor: String) {
        guard
            let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
            let navigationController = window.rootViewController as? UINavigationController else { return }
        
        navigationController.pushViewController(
            ColorViewController(with: deepLinkColor), animated: true
        )
    }
}
