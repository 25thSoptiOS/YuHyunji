//
//  Banner.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/10/26.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation
import UIKit

struct Banner {
    var bannerImg: UIImage?
    
    init(bannerName: String) {
        self.bannerImg = UIImage(named: bannerName)
    }
}
