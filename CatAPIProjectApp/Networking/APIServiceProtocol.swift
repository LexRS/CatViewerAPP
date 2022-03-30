//
//  APIServiceProtocol.swift
//  CatAPIProjectApp
//
//  Created by Алексей Поддубный on 29.03.2022.
//

import Foundation

protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
