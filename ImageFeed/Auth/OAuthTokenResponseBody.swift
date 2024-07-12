//
//  OAuthTokenResponseBody.swift
//  ImageFeed
//
//  Created by Daria Granina on 12.07.2024.
//

import Foundation

struct OAuthTokenResponseBody: Codable {
    let accessToken: String
    let tokenType: String
    let scope: String
    let createdAt: Int
}
