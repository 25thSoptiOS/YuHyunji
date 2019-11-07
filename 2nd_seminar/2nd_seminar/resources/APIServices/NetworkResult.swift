//
//  NetworkResult.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/11/02.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation

// 이 파일은 그대로 사용해도 됨!!!
// 1단계: 네트워크 상태의 5가지 결과 (성공, 요청 에러, 경로 에러, 서버 에러, 통신 실패)
enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
