//
//  ViewController.swift
//  Phil
//
//  Created by Phil Cappelli on 2/10/20.
//  Copyright © 2020 Phil Cappelli. All rights reserved.
//

import UIKit
import Branch
import SnapKit

class ColorViewController: UIViewController {
    // MARK: Properties
    
    lazy var shareLinkLabel: UILabel = { setupLabel() }()
    fileprivate var currentColorString = String()
    
    convenience init(with backgroundColor: String) {
        self.init()
        currentColorString = backgroundColor
        view.backgroundColor = Color(rawValue: backgroundColor)?.create
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonAndLabelViews()
        BranchEvent.standardEvent(.viewItem, withContentItem: BranchUniversalObject(title: currentColorString)).logEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = Color(rawValue: currentColorString)?.create
    }
    
    @objc func shareButtonTapped() {
        //BranchEvent.standardEvent(.purchase, withContentItem: BranchUniversalObject())
        let buo = BranchUniversalObject.init(title: currentColorString)
        buo.contentDescription = "Check out this cool color!"
        buo.imageUrl = "https://lorempixel.com/400/400"
        buo.publiclyIndex = true
        buo.locallyIndex = true
        
        let lp = BranchLinkProperties()
        lp.addControlParam("$deeplink_path", withValue: currentColorString)
        
        buo.showShareSheet(with: lp, andShareText: "Check this color out!", from: self, completion: nil)
    }
    
    @objc func longTap() {
        let buo = BranchUniversalObject(title: currentColorString)
        let lp = BranchLinkProperties()
        lp.addControlParam("$deeplink_path", withValue: currentColorString)
        buo.getShortUrl(with: lp) { url, error in
            guard let url = url else { return }
            DispatchQueue.main.async {
                self.shareLinkLabel.text = url
            }
        }
    }
    
}

fileprivate extension ColorViewController {
    func setupButtonAndLabelViews() {
        let shareButton =  UIBarButtonItem(title: "Share", style: UIBarButtonItem.Style.plain, target: self, action: #selector(shareButtonTapped))
        navigationItem.rightBarButtonItems = [shareButton]
        
        view.addSubview(shareLinkLabel)
        shareLinkLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func setupLabel() -> UILabel {
        let label = UILabel()
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.longTap))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Long Press for Branch Link"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .black
        label.addGestureRecognizer(longGesture)
        label.isUserInteractionEnabled = true
        return label
    }
}

