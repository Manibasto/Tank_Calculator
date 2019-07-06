//
//  ConstantVariables.swift
//  SpecaWorx
//
//  Created by Anil Kumar on 17/05/19.
//  Copyright © 2019 Anil Kumar. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func showConfirmAlert(title: String?, message: String?, buttonTitle: String, buttonStyle: UIAlertAction.Style, confirmAction: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: buttonStyle, handler:confirmAction))
        present(alert, animated: true, completion: nil)
    }
}


extension UIViewController{
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            //      print("invalid regex: \(error.localizedDescription)")
            return [error.localizedDescription]
        }
    }
}

var returnDiameter: String = ""
var returnLength: String   = ""
var returnCapacity         = Double()
var mobileData: String     = ""


struct TankValues{
    static var diameter: String   = ""
    static var length: String     = ""
    static var increments: String = ""
    static var type: String       = ""
}

     var diameterReturnedValue: String   = ""
     var lengthReturnedValue: String     = ""
     var capacityReturnedValue           = Double()
     var inchesReturnedValue: [String]   = []
     var gallonsReturnedValue: [String]  = []

