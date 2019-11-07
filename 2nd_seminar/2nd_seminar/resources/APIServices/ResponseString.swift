//
//  ResponseString.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/11/02.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation

// MARK: - ResponseString
// 성공했을 때 response body
// 3단계: Json을 Decode 할 Decodable Protocol 선언
// 이 파일이 있어야 디코딩 가능, 네이밍을 반드시 똑같이 맞춰주자
struct ResponseString: Codable {
    let success: Bool
    let message: String
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let userIdx: Int
    let id, password, name, phone: String
}

struct ResponseSignup: Codable {
    let success: Bool
    let message: String
    let data: Int?
}
