//
//  APIMockService.swift
//  CatAPIProjectApp
//
//  Created by Алексей Поддубный on 29.03.2022.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Breed], APIError>
    
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void) {
        completion(result)
    }
}
