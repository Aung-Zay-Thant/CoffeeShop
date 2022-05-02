//
//  MockOrderNetwork.swift
//  CoffeeShopTests
//
//  Created by aung zay on 01/05/2022.
//

@testable import CoffeeShop

final class MockOrderNetwork : OrderNetworkProtocol{
    
    var orderSuccess : Result<Void,NetworkError> = .success(())
    
    func makeOrder(address: String, cartHandler: CartHandler, completed: @escaping (Result<Void, NetworkError>) -> Void) {
        completed(orderSuccess)
    }
}


