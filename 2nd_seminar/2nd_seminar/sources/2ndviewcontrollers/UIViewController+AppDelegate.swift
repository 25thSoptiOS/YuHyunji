//
//  UIViewController+AppDelegate.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/10/26.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
