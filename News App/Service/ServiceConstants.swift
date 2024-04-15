//
//  ServiceConstants.swift
//  News App
//
//  Created by Fazli Altun on 4.03.2024.
//

import Foundation

enum ServiceConstants: String {
    case BASE_URL = "https://newsapi.org/v2/top-headlines?country=us&"
    case API_KEY = "apiKey=6a71b5d53cae4e3eaecee7fc45257d68"

    static func serviceEndpoint() -> String {
        "\(BASE_URL.rawValue)\(API_KEY.rawValue)"
    }
}
