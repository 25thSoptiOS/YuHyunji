//
//  APIConstants.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/11/02.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation

// 이 파일은 그대로 사용해도 됨!!!
// URL관리하는 곳
// 2단계로 내가 사용할 URL주소 미리 저장해두기
struct APIConstants {
    
    // 전역 변수로 사용할 수 있게 APIConstants 선언하여 사용
    static let BaseURL = "http://106.10.59.71:3000/users"
    
    /* 유저(User) */
    static let LoginURL = BaseURL + "/signin" // 로그인
    static let SignupURL = BaseURL + "/signup" // 회원가입
}
