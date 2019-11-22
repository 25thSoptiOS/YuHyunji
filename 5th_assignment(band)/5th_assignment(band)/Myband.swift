//
//  Myband.swift
//  5th_assignment(band)
//
//  Created by hjyoo on 2019/11/18.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation
import UIKit

struct Myband {
    var mybandimg: UIImage?
    var mybandlabel: UILabel?
    
    init(mybandName: String) {
        self.mybandimg = UIImage(named: mybandName)
    }
    
}
