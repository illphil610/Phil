//
//  Swift.swift
//  Phil
//
//  Created by Phil Cappelli on 3/2/20.
//  Copyright © 2020 Phil Cappelli. All rights reserved.
//

import UIKit

enum Color: String {
    case red
    case blue
    case green
    case purple
    case yellow
    case magenta
    case orange
    case cyan
    case brown
    
    static let allValues = [
        red, blue, green, purple, yellow, magenta, orange, cyan, brown
    ]
    
    var create: UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .blue:
            return UIColor.blue
        case .green:
            return UIColor.green
        case .purple:
            return UIColor.purple
        case .yellow:
            return UIColor.yellow
        case .magenta:
            return UIColor.magenta
        case .orange:
            return UIColor.orange
        case .cyan:
            return UIColor.cyan
        case .brown:
            return UIColor.brown
        }
    }
}

