//
//  UIViewController+AppDelegate.swift
//  5th_assignment(band)
//
//  Created by hjyoo on 2019/11/18.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
