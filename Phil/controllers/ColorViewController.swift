//
//  ViewController.swift
//  Phil
//
//  Created by Phil Cappelli on 2/10/20.
//  Copyright © 2020 Phil Cappelli. All rights reserved.
//

import UIKit
import Branch

class ColorViewController: UIViewController {
    // MARK: Properties
        
    lazy var colorLabel = { UILabel() }()
    fileprivate var currentColorString = String()
    
    convenience init(with backgroundColor: String) {
        self.init()
        
        currentColorString = backgroundColor
        view.backgroundColor = Color(rawValue: backgroundColor)?.create
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BranchEvent.standardEvent(.viewItem, withContentItem: BranchUniversalObject(title: currentColorString)).logEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = Color(rawValue: currentColorString)?.create
    }
    
    // MARK: Actions
    @IBAction func shareButtonClicked(_ sender: UIBarButtonItem) {
        BranchEvent.standardEvent(.purchase, withContentItem: BranchUniversalObject())
    }
    
    @IBAction func signinButtonClicked(_ sender: UIBarButtonItem) {
        BranchEvent.standardEvent(.completeRegistration)
    }
    
}

