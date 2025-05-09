//
//  RegisterRequestBody.swift
//  Week4
//
//  Created by 권석기 on 5/3/25.
//

import Foundation

struct RegisterRequestBody: Codable {
    let loginId: String
    let password: String
    let nickname: String
}
