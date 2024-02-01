//
//  ApiRequestDispatcher.swift
//  Rick&Morty
//
//  Created by javier pineda on 30/01/24.
//

import Foundation

class ApiRequestDispatcher {
    class func request<T: Codable>(apiRouter: ApiRouter) async throws -> T {
        guard let url = URL(string: apiRouter.stringUrl) else { throw ApiError.badUrl }
                
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method
        
        let session = URLSession(configuration: .default)
        return try await withCheckedThrowingContinuation { continuation in
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }
                
                guard let data = data else {
                    return continuation.resume(with: .failure(ApiError.noData))
                }
                
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        return continuation.resume(with: .success(responseObject))
                    }
                } catch {
                    return continuation.resume(with: .failure(ApiError.jsonParsingFailure))
                }
            }
            dataTask.resume()
        }
    }
}
