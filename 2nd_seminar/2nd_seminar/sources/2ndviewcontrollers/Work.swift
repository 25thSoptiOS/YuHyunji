//
//  Work.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/11/01.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation
import UIKit

struct Work {
    var workImg: UIImage?
    
    init(workName: String) {
        self.workImg = UIImage(named: workName)
    }
}
