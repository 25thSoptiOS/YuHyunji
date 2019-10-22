//
//  Roundingbutton.swift
//  2nd_assignment
//
//  Created by hjyoo on 2019/10/22.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class Roundingbutton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //값이 커질수록 둥글
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        //버튼 배경색
        //self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //버튼의 textcolor
        //self.tintColor = UIColor.white
        //버튼의 외곽선컬러
        //self.layer.borderColor =
        //버튼의 외곽선두께: 값이 커질수록 두꺼움
        //self.layer.borderWidth =

    }
}
