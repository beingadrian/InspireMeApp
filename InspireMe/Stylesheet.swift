//
//  Stylesheet.swift
//  InspireMe
//
//  Created by Adrian Wisaksana on 6/1/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import UIKit

/**
 * An enum that contains all the colours
 * that are going to be utilised.
 */
enum Colors {
    case Green
    case Blue
    case LightBlue
    case Orange
    case Purple
    case Red
    
    var color: UIColor {
        switch self {
        case .Green:
            return UIColor(hex: 0x4CD964)
        case .Blue:
            return UIColor(hex: 0x007AFF)
        case .Orange:
            return UIColor(hex: 0xFF9500)
        case .LightBlue:
            return UIColor(hex: 0x5AC8FA)
        case .Purple:
            return UIColor(hex: 0x5856D6)
        case .Red:
            return UIColor(hex: 0xFF3B30)
        }
    }
    
}

/**
 * Source: http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
 */
extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
}