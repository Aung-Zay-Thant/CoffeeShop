//
//  OrderNetworkProtocol.swift
//  CoffeeShop
//
//  Created by aung zay on 01/05/2022.
//

import Foundation

protocol OrderNetworkProtocol{
    func makeOrder(address : String , cartHandler : CartHandler, completed: @escaping (Result<Void, NetworkError>) -> Void)
}
