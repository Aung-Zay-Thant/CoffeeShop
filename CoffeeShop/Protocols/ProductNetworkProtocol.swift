//
//  ProductNetworkProtocol.swift
//  CoffeeShop
//
//  Created by aung zay on 01/05/2022.
//

import Foundation

protocol ProductNetworkProtocol{
    func getProducts(completed: @escaping (Result<[Product], NetworkError>) -> Void)
}
