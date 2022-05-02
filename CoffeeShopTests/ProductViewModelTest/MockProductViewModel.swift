//
//  MockProductViewModel.swift
//  CoffeeShop
//
//  Created by aung zay on 01/05/2022.
//

import Foundation


final class MockProductNetwork : ProductNetworkProtocol{
    var requestSuccess : Result<[Product],NetworkError> = .success([Product(name: "Test", price: 30, imageUrl: "testURL")])
    func getProducts(completed: @escaping (Result<[Product], NetworkError>) -> Void) {
        completed(requestSuccess)
    }
}
