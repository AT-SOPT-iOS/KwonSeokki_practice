//
//  RegisterService.swift
//  Week4
//
//  Created by 권석기 on 5/3/25.
//

import Foundation

class RegisterService {
    static let shared = RegisterService()
    private init() {}
    
    func makeRequestBody(loginId: String, password: String, nickname: String) -> Data? {
        do {
            let data = RegisterRequestBody(loginId: loginId, password: password, nickname: nickname)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/auth/signup")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
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
    func PostRegisterData(loginId: String, password: String, nickname: String) async throws -> RegisterResponseBody {
        
        guard let body = makeRequestBody(loginId: loginId, password: password, nickname: nickname) else {
            throw NetworkError.requestEncodingError
        }
        let request = self.makeRequest(body: body)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        do {
            let decoded = try JSONDecoder().decode(RegisterResponseWrapper.self, from: data)
            return decoded.data
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
