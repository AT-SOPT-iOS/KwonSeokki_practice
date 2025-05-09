//
//  NicknameListResponseModel.swift
//  Week4
//
//  Created by 권석기 on 5/3/25.
//

import Foundation

struct LoginResponse: Decodable {
    let success: Bool
    let code: String
    let message: String
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let userId: Int
}
