//
//  RegisterResponseBody.swift
//  Week4
//
//  Created by 권석기 on 5/3/25.
//

import Foundation

struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseBody
}

struct RegisterResponseBody: Codable {
    let userId: Double
    let nickname: String
}

