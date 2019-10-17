//
//  ViewController_cause.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/10/17.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class ViewController_cause: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var interval: UIStepper!
    @IBOutlet weak var Update: UILabel!
    @IBOutlet weak var Updateinterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        
        // (withIdentifier: "다음 viewcontroller의 storyboard ID")
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ViewController_result
            else {
                return
            }
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        // 뷰간의 코드로 present 연결
        self.present(rvc,animated: true)
        
    }
    
    //자동갱신 컨트롤
    @IBAction func updateAction(_ sender: UISwitch) {
        
        if sender.isOn {
            Update.text = "자동갱신"
        }
        
        else {
            Update.text = "비자동갱신"
        }
        
    }
    
    //interval 카운팅
    @IBAction func Countinginterval(_ sender: Any) {
        
        self.Updateinterval.text = String(Int(interval.value))
        
    }
    
}
