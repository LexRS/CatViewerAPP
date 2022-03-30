//
//  APIError.swift
//  CatAPIProjectApp
//
//  Created by Алексей Поддубный on 28.03.2022.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    var description: String {
        switch self {
        case .unknown:
            return "Unknown error"
        case .badURL:
            return "invalid url"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            return "parsing error: \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code: \(statusCode)"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse(statusCode: _):
            return "Sorry, the connection to our server failed"
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong"
        }
    }
    
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    
}
