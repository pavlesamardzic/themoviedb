//
//  Alert.swift
//  Rubicon
//
//  Created by Pavle on 19.6.18..
//  Copyright © 2018. Pavle. All rights reserved.
//

import UIKit

class Alert{
    
    func show(_ title:String, message: String, buttonText: String, viewController: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
