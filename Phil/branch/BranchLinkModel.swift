//
//  BranchLinkModel.swift
//  Phil
//
//  Created by Phil Cappelli on 3/2/20.
//  Copyright © 2020 Phil Cappelli. All rights reserved.
//

import Foundation

struct BranchLinkModel {
    // MARK: Properties

    let clickedBranchLink: Bool
    let deepLinkPath: String?
    let websiteUrl: String?
    let webOnlyLink: Bool
    let encodedUrl: String?

    // MARK: Initialization

    init(with branchLinkParams: [String: AnyObject]) {
        clickedBranchLink = branchLinkParams[BranchLinkKeys.clickedBranchLink] as? Bool ?? false
        deepLinkPath = branchLinkParams[BranchLinkKeys.deepLinkPath] as? String
        websiteUrl = branchLinkParams[BranchLinkKeys.websiteUrl] as? String
        webOnlyLink = BranchManager.isWebOnlyLink(for: branchLinkParams[BranchLinkKeys.webOnly])
        encodedUrl = websiteUrl?.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)
    }
    
    enum BranchLinkKeys {
        static let clickedBranchLink = "+clicked_branch_link"
        static let deepLinkPath = "$deeplink_path"
        static let websiteUrl = "$canonical_url"
        static let webOnly = "$web_only"
    }
    
}
