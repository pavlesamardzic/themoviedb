//
//  HideKeyboardWhenTappedAround.swift
//  Rubicon
//
//  Created by Pavle on 13.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import Foundation
import UIKit
public extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

