//
//  BranchManager.swift
//  Phil
//
//  Created by Phil Cappelli on 3/2/20.
//  Copyright © 2020 Phil Cappelli. All rights reserved.
//

import Foundation
import Branch

class BranchManager {
    
    // MARK: Initialization
    
    static func initializeBranch(with launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        Branch.getInstance().initSession(launchOptions: launchOptions) { params, error in
            guard error == nil, let branchLinkParams = params as? [String: AnyObject] else { return }
            determineLinkBehavior(for: BranchLinkModel(with: branchLinkParams))
        }
    }
    
    static func handleOpenUrl(url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        Branch.getInstance().application(nil, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    static func isWebOnlyLink(for webOnlyBranchParam: AnyObject?) -> Bool {
        guard let webLinkParamValue = webOnlyBranchParam as? String else { return false }
        return webLinkParamValue.caseInsensitiveCompare("true") == .orderedSame ? true : false
    }
}

fileprivate extension BranchManager {
    
    static func determineLinkBehavior(for branchLinkModel: BranchLinkModel) {
        guard branchLinkModel.clickedBranchLink else { return }
        
        guard let deeplinkPath = branchLinkModel.deepLinkPath else {
            guard branchLinkModel.webOnlyLink, let canonicalUrl = branchLinkModel.websiteUrl, let url = URL(string: canonicalUrl) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return
        }
        
        DeeplinkNavigator.shared.navigate(with: deeplinkPath)
    }
}
