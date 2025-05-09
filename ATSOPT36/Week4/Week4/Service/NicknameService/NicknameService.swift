//
//  RegisterService.swift
//  Week4
//
//  Created by 권석기 on 5/3/25.
//

import Foundation

class NicknameService {
    static let shared = NicknameService()
    private init() {}
    
    func makeRequestBody(nickname: String) -> Data? {
        do {
            let data = NickNameRequestBody(nickname: nickname)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/users")!
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        let header = ["Content-Type":"application/json"]
        header.forEach {
            // Coontent-Type으로 application/json
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        return request
    }
    
    // 최종요청
    func patchNicknameData(userId: String, nickname: String) async throws  {
        // body 생성
        guard let body = makeRequestBody(nickname: nickname) else {
            throw NetworkError.requestEncodingError
        }
        var request = self.makeRequest(body: body)
        
        request.addValue(userId, forHTTPHeaderField: "userId")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        do {
            let decoded = try JSONDecoder().decode(NickNameResponse.self, from: data)
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
