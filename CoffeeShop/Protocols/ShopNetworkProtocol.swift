//
//  ShopNetworkProtocol.swift
//  CoffeeShop
//
//  Created by aung zay on 01/05/2022.
//

import Foundation

protocol ShopNetworkProtocol{
    func getShopInfo(completed: @escaping (Result<Shop, NetworkError>) -> Void) 
}
