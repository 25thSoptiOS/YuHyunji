//
//  ViewController_result.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/10/17.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class ViewController_result: UIViewController {

    @IBOutlet weak var resultEmail: UILabel!
    @IBOutlet weak var resultUpdate: UILabel!
    @IBOutlet weak var resultInterval: UILabel!
    
    //이전 viewcontroller에서 넘겨준 데이터 어떤형식으로 받을지 선언
    var paramEmail: String = ""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval)) 분 마다 갱신"

        // Do any additional setup after loading the view.
    }
    
    //코드로 Back Action(이때,스토리보드에선 뷰간 연결해주면 안됨)
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
