//
//  ViewController_iEum.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/10/17.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import UIKit

class ViewController_iEum: UIViewController {
    
    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var pwView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    // 로그인 뷰의 모든 AutoLayout을 잡고 StackView의 'Center Y축을' @IBOutlet으로 선언해서 키보드 제스처에 따라 높이를 제어
    @IBOutlet weak var stackViewCenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loginBtn 둥근테두리 설정
        loginBtn.layer.cornerRadius = self.loginBtn.frame.width / 20
        loginBtn.layer.borderColor = CGColor(srgbRed: 255, green: 255, blue: 255, alpha: 1)
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.masksToBounds = true
        
        // 키보드 애니메이션
        initGestureRecognizer()
        
    }
    
    // 로그인 버튼눌렀을 때, 실제 액션
    // 5단계: Login Method
    @IBAction func LoginBtn(_ sender: UIButton) {
        
        // 로그인 서버 통신 구현 코드
        guard let id = idTextField.text else { return }
        guard let pwd = pwTextField.text else { return }
        
        //LoginServices.swift(의 in respones(=데이터의 틀))에 있는 파라미터와 연결(=실제 데이터)
        LoginService.shared.login(id, pwd) {
            data in
            
            switch data {
                
            //로그인 성공 시, 그 다음에 이루어지는 것 (ex: 화면전환..)
            case .success(let data):
                
                // DataClass 에서 받은 유저 정보 반환
                let user_data = data as! DataClass
                
                // 사용자의 토큰, 이름, 이메일, 전화번호 받아오기
                // 비밀번호는 안 받아와도 됨
                UserDefaults.standard.set(user_data.userIdx, forKey: "token")
                UserDefaults.standard.set(user_data.name, forKey: "name")
                UserDefaults.standard.set(user_data.phone, forKey: "phone")
                
                let main = UIStoryboard(name: "2ndMain", bundle: nil).instantiateViewController(identifier: "2nd")
                self.present(main, animated: true)
                
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
    
    // 키보드 제어 메소드
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
}

// 키보드 때문에 가려지지 않게 조정하는 extension
extension ViewController_iEum: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.idTextField.resignFirstResponder()
        self.pwTextField.resignFirstResponder()
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: idTextField))! || (touch.view?.isDescendant(of: pwTextField))! {
            
            return false
        }
        return true
    }
    
    // keyboard가 보여질 때 어떤 동작을 수행
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight: CGFloat // 키보드의 높이
        
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        // animation 함수
        // 최종 결과물 보여줄 상태만 선언해주면 애니메이션은 알아서
        // duration은 간격
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            self.logoImgView.alpha = 0
            
            // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
            self.stackViewCenterY.constant = -keyboardHeight/2 + 125
        })
        //스택뷰 CenterY 잡아와서 constant 계산
        
        self.view.layoutIfNeeded()
    }
    
    // keyboard가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            self.logoImgView.alpha = 1.0
            self.stackViewCenterY.constant = 0
        })
        
        self.view.layoutIfNeeded()
    }
    
    
    // observer
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

}
