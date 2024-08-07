//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by Daria Granina on 12.07.2024.
//

import Foundation

final class OAuth2TokenStorage {
    static let shared = OAuth2TokenStorage()
    private let bearerToken = "Bearer Token"
    private let userDefaults = UserDefaults.standard
    
    var token: String? {
        get {
            return userDefaults.string(forKey: bearerToken)
        }
        set {
            userDefaults.set(newValue, forKey: bearerToken)
        }
    }
}
