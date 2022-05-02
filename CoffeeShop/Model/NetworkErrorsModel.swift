//
//  NetworkErrors.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
