//
//  LoginServices.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/11/02.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation
import Alamofire

// 4단계: LoginService 작성
class LoginService {
    
    static let shared = LoginService()
    
    // body에 담을 파라미터
    // "completion: @escaping"(=completion handler) = escaping closure : request 후에 response를 받아오기 전에 실행될 수 있기 때문에 func_login가 모두 반환된 후(= response가 서버로부터 온 후)실행 될 수 있도록 해주는 역할
    func login(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "id": id,
            "pwd": pwd
        ]
        
        //request만들기
        //1: URL 주소, 2: method 방법 3: 파라미터 , 4: encoding 방식 , 5: header 종류
        Alamofire.request(APIConstants.LoginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in //r
                // "completion: @escaping" 실행 후 위 구문으로 복귀?
                
                //                print("request", response.request)
                //                print("response", response.response)
                //                print("data", response.data)
                //                print("result", response.result)
                
                // parameter 위치
                switch response.result {
                    
                // 통신 성공 - 네트워크 연결
                case .success:
                    if let value = response.result.value {

                        if let status = response.response?.statusCode {
                            
                            //result확인 -> response확인 -> status 분기-> 200이면(성공) -> decoding -> 로그인
                            switch status {
                            case 200:
                                do {
                                    //decoding 시작
                                    let decoder = JSONDecoder()
                                    print("value", value)
                                    let result = try decoder.decode(ResponseString.self, from: value)
                                    
                                    // ResponseString에 있는 success로 분기 처리
                                    switch result.success {
                                        
                                    case true:
                                        print("success") //진정한 로그인 succes = 키의 이름이 "succes"
                                        completion(.success(result.data))

                                    case false:
                                        //(NetworkResult.swift에 선언한 것)
                                        completion(.requestErr(result.message))
                                    }
                                }
                                catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                    print(APIConstants.LoginURL)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }// switch
                        }// if let
                    }
                    break
                    
                // 통신 실패 - 네트워크 연결
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    // .networkFail이라는 반환 값이 넘어감
                    break
                } // response.result switch
        } // alamofire.request
    } // func login
} // struct






