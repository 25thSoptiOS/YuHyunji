//
//  SingupServices.swift
//  2nd_seminar
//
//  Created by hjyoo on 2019/11/02.
//  Copyright © 2019 hjyoo. All rights reserved.
//

import Foundation
import Alamofire

//회원가입 메소드
class SignupService {
    
    static let shared = SignupService()
    
    func signup(_ id: String, _ pwd: String, _ name: String, _ phone: String, completion: @escaping (NetworkResult<Any>) -> Void) {
            
            let header: HTTPHeaders = [
                "Content-Type" : "application/json"
            ]
            
            let body: Parameters = [
                "id": id,
                "pwd": pwd,
                "name": name,
                "phone": phone
            ]
            
            //request만들기
            Alamofire.request(APIConstants.SignupURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
                .responseData { response in
                    //"completion: @escaping" 실행 후 위 구문으로 복귀?
                
                    // parameter 위치
                    switch response.result {
                        
                    // 통신 성공 - 네트워크 연결
                    case .success:
                        
                        //value는 byte로 되어있음 print(value)
                        if let value = response.result.value {
                            
                            //response의 respones안에 있는 statusCode를 추출
                            if let status = response.response?.statusCode {
                                
                                //result확인 -> response확인 -> status 분기-> 200이면(성공) -> decoding -> 로그인
                                //Http status Code 상태 코드에 따라 분기 처리
                                //200 성공, 300 리다이렉션, 400 클라오류, 500 서버오류
                                switch status {
                                case 200:
                                    do {
                                        //decoding 시작
                                        //선언했던 decodable Protocol 사용
                                        let decoder = JSONDecoder()
                                        //print("value", value)
                                        let result = try decoder.decode(ResponseString.self, from: value)
                                        
                                        //ResponseString에 있는 success로 분기 처리
                                        //decoding 성공했는지 확인
                                        switch result.success {
                                            
                                        case true:
                                            //print("success") //진정한 로그인 succes = 키의 이름이 "succes"
                                            completion(.success(result.data))

                                        case false:
                                            //(NetworkResult.swift에 선언한 것)
                                            completion(.requestErr(result.message))
                                        }
                                    }
                                    catch {
                                        completion(.pathErr)
                                        print(error.localizedDescription)
                                        print(APIConstants.SignupURL)
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
        } // func signup
    } // struct
