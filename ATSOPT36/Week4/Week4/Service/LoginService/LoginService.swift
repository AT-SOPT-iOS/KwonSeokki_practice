//
//  GetInfoService.swift
//  Week4
//
//  Created by 권석기 on 5/3/25.
//

import Foundation

class LoginService {
    
    static let shared = LoginService()
    private init() {}
    
    private func makeRequestBody(loginId: String, password: String) -> Data? {
        do {
            let data = LoginRequestBody(loginId: loginId, password: password)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    func makeRequest(loginId: String, password: String) -> URLRequest? {
        guard let body = makeRequestBody(loginId: loginId, password: password) else { return nil }
        let  urlString = "https://api.atsopt-seminar4.site/api/v1/auth/signin"
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpBody = body
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func requestLogin(loginId: String, password: String) async throws -> LoginResponse  {
        guard let request = makeRequest(loginId: loginId, password: password) else {
            throw NetworkError.requestEncodingError
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
            
            return decoded
        } catch {
            print(error)
            throw NetworkError.responseDecodingError
        }
    }
}
