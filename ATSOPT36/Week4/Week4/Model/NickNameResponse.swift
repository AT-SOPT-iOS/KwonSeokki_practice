//
//  NickNameResponse.swift
//  Week4
//
//  Created by 권석기 on 5/9/25.
//

import Foundation

struct NickNameResponse: Decodable {
    let success: Bool
    let code: String
    let message: String
    let data: NickNameResponseData?
}

struct NickNameResponseData: Decodable {
}
