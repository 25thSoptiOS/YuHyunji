//
//  ViewController_iEum_signup.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/11/02.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class ViewController_iEum_signup: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
         super.viewDidLoad()

         // Do any additional setup after loading the view.
    }
    
    @IBAction func SignupBtn(_ sender: UIButton) {
        
        // 로그인 서버 통신 구현 코드
        guard let id = idTextField.text else { return }
        guard let pwd = pwTextField.text else { return }
        guard let name = nameTextField.text else { return }
        guard let phone = phoneTextField.text else { return }
        
        //LoginServices.swift(의 in respones(=데이터의 틀))에 있는 파라미터와 연결(=실제 데이터)
        SignupService.shared.signup(id, pwd, name, phone) {
            data in
            
            switch data {
                
            //로그인 성공 시, 그 다음에 이루어지는 것 (ex: 화면전환..)
            case .success(let data):
                
                // ResponseString 에서 받은 유저 정보 반환
                let user_data = data as! ResponseSignup
                
                
            case .requestErr(let message):
                print("request error")
                //self.simpleAlert(title: "로그인 실패", message: "\(message)")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print("networkFail")
                //self.simpleAlert(title: "로그인 실패", message: "네트워크 상태를 확인해주세요.")
            }
        }
    }
    
    
}

