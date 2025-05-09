//
//  GetInfoService.swift
//  Week4
//
//  Created by 권석기 on 5/3/25.
//

import Foundation

class GetInfoService {
    
    static let shared = GetInfoService()
    private init() {}
    
    func makeRequest(keyword: String?, userId: Int) -> URLRequest? {
        var urlString = "https://api.atsopt-seminar4.site/api/v1/users"
        
        if let keyword = keyword, !keyword.isEmpty {
            if let encodedKeyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                urlString += "?keyword=\(encodedKeyword)"
            }
        }
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func fetchNicknameList(keyword: String?, userId: Int) async throws -> [String]  {
        guard let request = makeRequest(keyword: keyword, userId: userId) else {
            throw NetworkError.requestEncodingError
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(NicknameListResponseWrapper.self, from: data)
            
            return decoded.data.nicknameList
        } catch {
            print(error)
            throw NetworkError.responseDecodingError
        }
    }
}
