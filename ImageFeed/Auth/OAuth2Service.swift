//
//  0Auth2Service.swift
//  ImageFeed
//
//  Created by Daria Granina on 11.07.2024.
//

import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    
    private var oauthToken: String? {
        get { OAuth2TokenStorage().token }
        set { OAuth2TokenStorage().token = newValue }
    }
    
    private init() {}
    
    func makeOAuthTokenRequest(code: String) -> URLRequest? {
        guard
            let baseURL = URL(string: "https://unsplash.com")
        else {
            print("BaseUrl cannot be constructed")
            return nil
        }
        
        guard
            let url = URL(
                string: "/oauth/token"
                + "?client_id=\(Constants.accessKey)"
                + "&&client_secret=\(Constants.secretKey)"
                + "&&redirect_uri=\(Constants.redirectURI)"
                + "&&code=\(code)"
                + "&&grant_type=authorization_code",
                relativeTo: baseURL
            ) else {
            print("Unable to construct makeOAuthTokenRequestUrl")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
    
    
    func fetchOAuthToken(code: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let request = makeOAuthTokenRequest(code: code) else {
            print("Не удалось создать POST HTTP запрос в Unsplash")
            return
        }
        
        URLSession.shared.data(for: request){ result in
            switch result {
            case .success(let data):
                do {
                    let tokenResponse = try JSONDecoder().decode(OAuthTokenResponseBody.self, from: data)
                    completion(.success(tokenResponse.accessToken))
                } catch {
                    print("Ошибка при JSON декодировании: \(error)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("Произошла сетевая ошибка: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
