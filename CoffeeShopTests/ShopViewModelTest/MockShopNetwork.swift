//
//  MockShopNetwork.swift
//  CoffeeShopTests
//
//  Created by aung zay on 01/05/2022.
//

import Foundation
@testable import CoffeeShop

final class MockShopNetwork : ShopNetworkProtocol{
    var requestSuccess : Result<Shop,NetworkError> = .success((Shop(name: "Shop Name", rating: 9, openingTime: "15:01:01.772Z", closingTime: "19:45:51.365Z")))
    func getShopInfo(completed: @escaping (Result<Shop, NetworkError>) -> Void) {
        completed(requestSuccess)
    }
    
}
